"use client";

import { useEffect, useState } from "react";
import Header from "@/components/Header";
import Navbar from "@/components/Navbar";
import { authenticatedfetch } from "@/app/backend/authenticatedfetch";
import {getAuth, sendPasswordResetEmail} from "firebase/auth";
import firebase_app from "@/firebase/config";

export default function AdminPage() {
    const [admin, setAdmin] = useState<any>(null);
    const [teachers, setTeachers] = useState<any[]>([]);
    const [showAddTeacher, setShowAddTeacher] = useState(false);
    const [showUploadCSV, setShowUploadCSV] = useState(false);
    const [csvFile, setCsvFile] = useState<File | null>(null);
    const [uploading, setUploading] = useState(false);
    const [uploadError, setUploadError] = useState<string | null>(null);
    const [resetStatus, setResetStatus] = useState<Record<string, number>>({});
    const [now, setNow] = useState(Date.now());
    const [newTeacher, setNewTeacher] = useState({
        displayName: "",
        email: "",
    });

    const isOnCooldown = (email: string) => {
        const until = resetStatus[email];
        return typeof until === "number" && now < until;
    };

    const remainingSeconds = (email: string) => {
        const until = resetStatus[email];
        if (!until) return 0;
        return Math.max(0, Math.ceil((until - now) / 1000));
    };

    const handlePasswordReset = async (email: string) => {
        if (isOnCooldown(email)) return;

        try {
            await sendPasswordResetEmail(getAuth(firebase_app), email);

            // 60 second cooldown
            setResetStatus(prev => ({
                ...prev,
                [email]: Date.now() + 60_000,
            }));
        } catch (err) {
            console.error(`Failed to send reset email to ${email}`, err);
            alert("Failed to send password reset email.");
        }
    };


    const handleCsvUpload = async () => {
        if (!csvFile || !admin) return;
        if (!csvFile.name.endsWith(".csv")) {
            setUploadError("Please upload a CSV file");
            return;
        }


        setUploading(true);
        setUploadError(null);

        const formData = new FormData();
        formData.append("usersCSV", csvFile);
        const auth = getAuth(firebase_app);
        const token = await auth.currentUser!.getIdToken();

        try {
            const res = await authenticatedfetch(
                "http://localhost:8080/users/bulkcreate",
                {
                    method: "POST",
                    headers: {
                        Authorization: `Bearer ${token}`,
                    },
                    body: formData,
                }
            );

            if (!res.ok) {
                const errorData = await res.json();
                setUploadError(errorData.message || "Upload failed");
            } else {
                const emails = await extractEmailsFromCsv(csvFile);
                for (const email of emails) {
                    try {
                        await sendPasswordResetEmail(auth, email);
                    } catch (err) {
                        console.error(`Failed to send reset email to ${email}`, err);
                    }
                }
                setShowUploadCSV(false);
                const teachersRes = await authenticatedfetch(
                    `http://localhost:8080/users/teachers?schoolID=${admin.schoolId}`
                );
                if (teachersRes.ok) {
                    setTeachers(await teachersRes.json());
                }
            }
        } catch (error) {
            setUploadError("An unexpected error occurred");
        } finally {
            setUploading(false);
            setCsvFile(null);
        }
    }

    const extractEmailsFromCsv = async (file: File): Promise<string[]> => {
        const text = await file.text();
        const lines = text.split("\n").slice(1); // skip header
        return lines
            .map(line => line.split(",")[0]?.trim())
            .filter(email => email && email.includes("@"));
    };



    useEffect(() => {
        const loadData = async () => {
            const adminRes = await authenticatedfetch(
                "http://localhost:8080/users/current"
            );
            const adminData = await adminRes.json();
            setAdmin(adminData);

            const teachersRes = await authenticatedfetch(
                `http://localhost:8080/users/teachers?schoolID=${adminData.schoolId}`
            );
            if (teachersRes.ok) {
                setTeachers(await teachersRes.json());
            }
        };

        loadData();
    }, []);

    useEffect(() => {
        const hasActiveCooldowns = Object.values(resetStatus).some(
            until => until > Date.now()
        );

        if (!hasActiveCooldowns) return;

        const interval = setInterval(() => {
            setNow(Date.now());
        }, 1000);

        return () => clearInterval(interval);
    }, [resetStatus]);


    if (!admin) {
        return (
            <>
                <Header />
                <Navbar />
                <main className="p-8 text-center">Loading…it's possible you may need to visit the homepage and come back to the dashboard because of an error.</main>
            </>
        );
    }

    return (
        <>
            <Header />
            <Navbar />

            <main className="mx-auto max-w-6xl p-8 space-y-10">
                <h1 className="text-4xl font-bold">Admin Dashboard</h1>

                <section className="rounded-lg border p-6 space-y-2">
                    <h2 className="text-xl font-semibold">School Overview</h2>
                    <div><strong>Name:</strong> {admin.displayName}</div>
                    <div><strong>Email:</strong> {admin.email}</div>
                    <div><strong>Role:</strong> {admin.role}</div>
                    <div><strong>School:</strong> {admin.school}</div>
                    <div><strong>School ID:</strong> {admin.schoolId}</div>
                    <div><strong>Admin:</strong> {String(admin.isAdmin)}</div>
                </section>

                <section className="space-y-6">
                    <div className="flex justify-between items-center">
                        <h2 className="text-2xl font-semibold">
                            Teacher Management
                        </h2>
                        <div className="flex gap-4">
                            <button className="px-4 py-2 border rounded"
                            onClick={() => setShowUploadCSV(true)}>
                                Upload CSV
                            </button>
                            <button className="px-4 py-2 bg-primary text-primary-foreground rounded"
                                    onClick={() => setShowAddTeacher(true)}>
                                Add Teacher
                            </button>
                        </div>
                    </div>

                    <div className="overflow-x-auto border rounded">
                        <table className="w-full text-left">
                            <thead className="bg-muted">
                            <tr>
                                <th className="p-3">Name</th>
                                <th className="p-3">Email</th>
                                <th className="p-3">Role</th>
                                <th className="p-3">Email Reset</th>
                            </tr>
                            </thead>
                            <tbody>
                            {teachers.length === 0 && (
                                <tr>
                                    <td
                                        colSpan={3}
                                        className="p-6 text-center opacity-70"
                                    >
                                        No teachers added yet
                                    </td>
                                </tr>
                            )}
                            {teachers.map((t) => (
                                <tr key={t.uid} className="border-t">
                                    <td className="p-3">{t.displayName}</td>
                                    <td className="p-3">{t.email}</td>
                                    <td className="p-3">{t.role}</td>
                                    <td className="p-3">
                                        <button
                                            disabled={isOnCooldown(t.email)}
                                            onClick={() => handlePasswordReset(t.email)}
                                            className={`
                                                    px-3 py-1.5 rounded-md text-sm font-medium transition
                                                    border
                                                    ${isOnCooldown(t.email)
                                                ? "bg-muted text-muted-foreground cursor-not-allowed"
                                                : "bg-background hover:bg-muted text-foreground border-border"}
    `}
                                        >
                                            {isOnCooldown(t.email)
                                                ? `Sent (${remainingSeconds(t.email)}s)`
                                                : "Send reset email"}
                                        </button>
                                    </td>
                                </tr>
                            ))}
                            </tbody>
                        </table>
                    </div>
                    {showAddTeacher && (
                        <div className="fixed inset-0 bg-black/40 flex items-center justify-center">
                            <div className="bg-background p-6 rounded-lg w-96 space-y-4">
                                <h3 className="text-xl font-semibold">Add Teacher</h3>

                                <input
                                    className="w-full border p-2 rounded"
                                    placeholder="Full Name"
                                    value={newTeacher.displayName}
                                    onChange={(e) =>
                                        setNewTeacher({ ...newTeacher, displayName: e.target.value })
                                    }
                                />

                                <input
                                    className="w-full border p-2 rounded"
                                    placeholder="Email"
                                    type="email"
                                    value={newTeacher.email}
                                    onChange={(e) =>
                                        setNewTeacher({ ...newTeacher, email: e.target.value })
                                    }
                                />

                                <div className="flex justify-end gap-3">
                                    <button onClick={() => setShowAddTeacher(false)}>Cancel</button>
                                    <button
                                        className="bg-primary text-primary-foreground px-4 py-2 rounded"
                                        onClick={async () => {
                                            await authenticatedfetch(
                                                "http://localhost:8080/users/teachers/create?name=" + newTeacher.displayName + "&email=" + newTeacher.email + "&schoolID=" + encodeURIComponent(admin.schoolId),
                                                {
                                                    method: "POST",
                                                    headers: { "Content-Type": "application/json" },
                                                }
                                            );

                                            setShowAddTeacher(false);
                                            setNewTeacher({ displayName: "", email: "" });
                                            const teachersRes = await authenticatedfetch(
                                                `http://localhost:8080/users/teachers?schoolID=${admin.schoolId}`
                                            );
                                            if (teachersRes.ok) {
                                                setTeachers(await teachersRes.json());
                                                sendPasswordResetEmail(getAuth(firebase_app), newTeacher.email);
                                            }

                                        }}
                                    >
                                        Add
                                    </button>
                                </div>
                            </div>
                        </div>
                    )}
                    {showUploadCSV && (
                        <div className="fixed inset-0 bg-black/40 flex items-center justify-center">
                            <div className="bg-background p-6 rounded-lg w-96 space-y-4">

                                    <h2 className="text-xl font-semibold mb-2">Bulk Upload Teachers via .csv</h2>
                                    <p className="text-lg font-normal mb-2">Format: email,lastName,firstName</p>

                                    <input
                                        type="file"
                                        accept=".csv"
                                        onChange={(e) => setCsvFile(e.target.files?.[0] ?? null)}
                                    />

                                    <button
                                        className="mt-3 px-4 py-2 bg-blue-600 text-white rounded disabled:opacity-50"
                                        disabled={!csvFile || uploading}
                                             onClick={handleCsvUpload}
                                    >
                                        {uploading ? "Uploading..." : "Upload CSV"}
                                    </button>

                                    {uploadError && (
                                        <p className="text-red-600 mt-2">{uploadError}</p>
                                    )}

                            </div>
                        </div>


                    )}


                </section>
            </main>
        </>
    );
}
