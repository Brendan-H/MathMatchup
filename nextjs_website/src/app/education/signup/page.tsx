"use client";

import Header from "@/components/Header";
import Navbar from "@/components/Navbar";
import { Button } from "@/components/ui/button";
import { useState } from "react";
import { useRouter } from "next/navigation";
import createUser from "@/firebase/auth/createUser";

export default function EducationSignupPage() {
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [school, setSchool] = useState("");
    const [adminname, setName] = useState("");
    const [role, setRole] = useState("");
    const router = useRouter();

    const handleSignup = async () => {
        const router = useRouter();
        if (!email || !password || !school || !adminname || !role) return;

        const { result, error } = await createUser(email, password);
        if (error || !result?.user) return;
        const user = result.user;

        const token = await user.getIdToken();

        const response = await fetch("http://localhost:8080/users/create", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                Authorization: `Bearer ${token}`,
            },
            body: JSON.stringify({
                uid: result.user.uid,
                email,
                displayName: adminname,
                role,
                school,
                isAdmin: true,
            }),
        });
        if (!response.ok) {
            console.error("Backend user creation failed");
            return;
        }

        router.push("/education/admin");

    }

    return (
        <>
            <Header />
            <Navbar />

            <main className="mx-auto max-w-md px-6 py-16 space-y-6">
                <h1 className="text-3xl font-bold text-center">
                    Create School Account
                </h1>

                <input
                    className="w-full p-3 border rounded"
                    placeholder="School Name"
                    value={school}
                    onChange={(e) => setSchool(e.target.value)}
                />

                <input
                    className="w-full p-3 border rounded"
                    placeholder="Your full name"
                    aria-label="Full name"
                    value={adminname}
                    onChange={(e) => setName(e.target.value)}
                />

                <select
                    className="w-full p-3 border rounded bg-white"
                    aria-label="Role in school"
                    value={role}
                    onChange={(e) => setRole(e.target.value)}
                >
                    <option value="" disabled>
                        Select role in school
                    </option>
                    <option value="principal">Principal</option>
                    <option value="tech_lead">Tech Lead</option>
                    <option value="teacher">Teacher</option>
                    <option value="admin">Admin</option>
                    <option value="other">Other</option>
                </select>

                <input
                    className="w-full p-3 border rounded"
                    placeholder="Admin Email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                />

                <input
                    type="password"
                    className="w-full p-3 border rounded"
                    placeholder="Password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                />

                <Button className="w-full" onClick={handleSignup}>
                    Continue
                </Button>
            </main>
        </>
    );
}
