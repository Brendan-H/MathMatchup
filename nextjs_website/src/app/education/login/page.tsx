"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { getAuth, signInWithEmailAndPassword } from "firebase/auth";
import firebase_app from "@/firebase/config";
import Header from "@/components/Header";
import Navbar from "@/components/Navbar";
import { Button } from "@/components/ui/button";

export default function LoginPage() {
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [error, setError] = useState<string | null>(null);
    const router = useRouter();

    const handleLogin = async () => {
        try {
            const auth = getAuth(firebase_app);
            await signInWithEmailAndPassword(auth, email, password);
            router.push("/education/admin");
        } catch {
            setError("Invalid email or password");
        }
    };

    return (
        <>
            <Header />
            <Navbar />
            <main className="mx-auto max-w-md p-8 space-y-6">
                <h1 className="text-3xl font-bold text-center">Admin Login</h1>

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
            </main>
        </>
    );
}
