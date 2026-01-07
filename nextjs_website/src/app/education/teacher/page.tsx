"use client";

import React, {useEffect, useState} from "react";
import {resetPassword} from "@/firebase/auth/resetpassword";
import Header from "@/components/Header";
import Navbar from "@/components/Navbar";
import { useRouter } from "next/navigation";
import {authenticatedfetch} from "@/app/backend/authenticatedfetch";
//TODO make header dashboard button choose between admin or teacher dashboard

export default function TeacherPasswordPage() {
    const [teacher, setTeacher] = useState<any>(null);
    const router = useRouter();

    useEffect(() => {
        const loadData = async () => {
            const teacherRes = await authenticatedfetch(
                "http://localhost:8080/users/current"
            );
            const adminData = await teacherRes.json();
            setTeacher(adminData);

        };

        loadData();
    }, []);

    return (
        <>
            <Header />
            <Navbar />
            <main className="mx-auto max-w-5xl p-8 space-y-8">
                <h1 className="text-2xl font-bold text-center">Welcome, teacher</h1>
                <h1 className="text-xl font-normal text-center">Test School</h1>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div className="border rounded-lg p-6 space-y-3 items-center text-center">
                        <h2 className="text-xl font-semibold">Create a New Game</h2>
                        <p>Start a live MathMatchup session for your class.</p>
                        <button
                            className="px-6 py-4 bg-primary text-primary-foreground rounded hover:bg-primary/90"
                            onClick={() => router.push("/education/teacher/creategame")}
                        >
                            Create Game
                        </button>
                    </div>
                    <div className="border rounded-lg p-6 space-y-3 items-center text-center">
                        <h2 className="text-xl font-semibold">View Class Analytics</h2>
                        <p>See where your class is succeeding and struggling.</p>
                        <button
                            className="px-6 py-4 bg-primary text-primary-foreground rounded hover:bg-primary/90"
                            onClick={() => router.push("/education/teacher/pastgames")}
                        >
                            View Analytics
                        </button>
                    </div>
                </div>


            </main>


        </>
    );
}