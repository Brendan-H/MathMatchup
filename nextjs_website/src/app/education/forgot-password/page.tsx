"use client";

import React, {useState} from "react";
import {resetPassword} from "@/firebase/auth/resetpassword";
import Header from "@/components/Header";
import Navbar from "@/components/Navbar";
import { useRouter } from "next/navigation";


export default function ForgotPasswordPage() {
    const [email, setEmail] = useState("");
    const router = useRouter();

    const handlePasswordReset = async () => {
        try {
            await resetPassword(email);
            alert("Password reset email sent!");
            router.push("/");
        } catch (error) {
            console.error("Error sending password reset email:", error);
            alert("Failed to send password reset email.");
        }

    }
    return (
        <>
            <Header />
            <Navbar />
            <main className="mx-auto max-w-md p-8 space-y-6">
                <h1 className="text-3xl font-bold text-center">Forgot Password</h1>
                <input
                    className="w-full p-3 border rounded"
                    placeholder="Email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                />
                <button className="w-full" onClick={handlePasswordReset}>
                    Reset Password
                </button>
            </main>


        </>
    );
}