"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import Header from "@/components/Header";
import Navbar from "@/components/Navbar";
import { authenticatedfetch } from "@/app/backend/authenticatedfetch";
import { getAuth } from "firebase/auth";
import firebase_app from "@/firebase/config";

export default function AdminPage() {
    const [userData, setUserData] = useState<any>(null);
    const router = useRouter();

    useEffect(() => {
        const loadUser = async () => {
            const auth = getAuth(firebase_app);
            const user = auth.currentUser;

            if (!user) {
                router.push("/education/login");
                return;
            }

            try {
                const res = await authenticatedfetch(
                    `http://localhost:8080/users/current`
                );

                if (!res.ok) {
                    throw new Error("Bad request");
                }

                const data = await res.json();
                setUserData(data);
            } catch (err) {
                console.error(err);
                router.push("/education/login");
            }
        };

        loadUser();
    }, [router]);

    if (!userData) {
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

            <main className="mx-auto max-w-3xl p-8 space-y-6">
                <h1 className="text-3xl font-bold">Admin Dashboard</h1>

                <div className="space-y-2">
                    <div><strong>Name:</strong> {userData.displayName}</div>
                    <div><strong>Email:</strong> {userData.email}</div>
                    <div><strong>Role:</strong> {userData.role}</div>
                    <div><strong>School:</strong> {userData.school}</div>
                    <div><strong>School ID:</strong> {userData.schoolId}</div>
                    <div><strong>Admin:</strong> {String(userData.isAdmin)}</div>
                </div>
            </main>
        </>
    );
}
