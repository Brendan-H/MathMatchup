"use client";

import React, { useState } from "react";
import { useRouter } from "next/navigation";
import { getAuth, signInWithEmailAndPassword } from "firebase/auth";
import firebase_app from "@/firebase/config";
import Header from "@/components/Header";
import Navbar from "@/components/Navbar";
import { Button } from "@/components/ui/button";
import {authenticatedfetch} from "@/app/backend/authenticatedfetch";

export default function LoginPage() {
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [error, setError] = useState<string | null>(null);
    const router = useRouter();

    const handleLogin = async () => {
        setError(null);
        const auth = getAuth(firebase_app);

        try {
            await signInWithEmailAndPassword(auth, email, password);
        } catch (err) {
            setError("Invalid email or password.");
            return;
        }

        try {
            const res = await authenticatedfetch("http://localhost:8080/users/current");
            if (!res.ok) {
                const text = await res.text();
                throw new Error(text);
            }
            const user = await res.json();
            console.log(user);

            if (user.isAdmin) {
                router.push("/education/admin");
            } else if (user.role === "teacher") {
                router.push("/education/teacher");
            } else {
                router.push("/");
            }
        } catch (err) {
            console.error(err);
            setError("Login succeeded, but dashboard routing failed.");
        }
    };


    return (
        <>
            <Header />
            <Navbar />
            <main className="mx-auto max-w-md p-8 space-y-6">
                <h1 className="text-3xl font-bold text-center">Admin Login</h1>
                <p className="text-lg font-bold text-center">Note: the backend is not currently running, so login will not work</p>

                <input
                    className="w-full p-3 border rounded"
                    placeholder="Email"
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

                {error && <p className="text-red-500 text-sm">{error}</p>}

                <Button className="w-full" onClick={handleLogin}>
                    Log in
                </Button>

                <button
                    className="underline opacity-80 mx-auto block text-sm"
                    onClick={() => router.push("/education/forgot-password")}
                >
                    Forgot Password?
                </button>
            </main>
        </>
    );
}
