"use client";

import { useEffect, useState } from "react";
import Header from "@/components/Header";
import Navbar from "@/components/Navbar";
import { authenticatedfetch } from "@/app/backend/authenticatedfetch";

export default function AdminPage() {
    const [admin, setAdmin] = useState<any>(null);
    const [teachers, setTeachers] = useState<any[]>([]);

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

    if (!admin) {
        return (
            <>
                <Header />
                <Navbar />
                <main className="p-8 text-center">Loading…</main>
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
                            <button className="px-4 py-2 border rounded">
                                Upload CSV
                            </button>
                            <button className="px-4 py-2 bg-primary text-primary-foreground rounded">
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
                                </tr>
                            ))}
                            </tbody>
                        </table>
                    </div>
                </section>
            </main>
        </>
    );
}
