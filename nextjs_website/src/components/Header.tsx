"use client";

import React from 'react';
import Image from 'next/image';
import Link from "next/link";
import { useAuthenticatedUser } from "@/firebase/auth/authstate";
import { getAuth, signOut } from "firebase/auth";
import firebase_app from "@/firebase/config";
import mathmatchuplogo from '../../public/images/mathmatchuplogo.png';
import {useRouter} from "next/navigation";


export default function Header() {
    const { user, loading } = useAuthenticatedUser();
    const router = useRouter();
    const logout = async () => {
        await signOut(getAuth(firebase_app));
        router.push("/");
    };

    return (
        <header className="bg-primary text-primary-foreground">
            <div className="mx-auto max-w-6xl px-6 py-16 flex flex-col md:flex-row items-start md:items-center justify-between gap-6 md:gap-10">
                <div className="flex items-center gap-6 md:gap-10">
                    <div className="rounded-full bg-white p-3 overflow-hidden">
                        <Image
                            src={mathmatchuplogo}
                            alt="MathMatchup Logo"
                            width={160}
                            height={160}
                        />
                    </div>

                    <div>
                        <h2 className="text-2xl font-medium opacity-90">
                            Welcome to
                        </h2>
                        <h1 className="text-5xl font-bold leading-tight">
                            MathMatchup
                        </h1>
                        <p className="mt-2 text-lg opacity-80">
                            The math quiz app with hidden partners
                        </p>
                    </div>
                </div>

                {!loading && (
                    <div className="flex items-center gap-4 text-sm mt-4 md:mt-0">
                        {!user ? (
                            <>
                                <Link
                                    href="/education/login"
                                    className="hover:underline"
                                >
                                    Admin Login
                                </Link>
                                <Link
                                    href="/education/signup"
                                    className="bg-white text-primary px-4 py-2 rounded font-medium"
                                >
                                    Get Started
                                </Link>
                            </>
                        ) : (
                            <>
                                <Link
                                    href="/education/admin"
                                    className="hover:underline"
                                >
                                    Dashboard
                                </Link>
                                <button
                                    onClick={logout}
                                    className="underline opacity-80"
                                >
                                    Logout
                                </button>
                            </>
                        )}
                    </div>
                )}
            </div>
        </header>
    );
}
