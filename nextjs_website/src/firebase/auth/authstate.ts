"use client";

import { getAuth, onAuthStateChanged, User } from "firebase/auth";
import { useEffect, useState } from "react";
import firebase_app from "@/firebase/config";

export function useAuthenticatedUser() {
    const [user, setUser] = useState<User | null>(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const auth = getAuth(firebase_app);
        return onAuthStateChanged(auth, (u) => {
            setUser(u);
            setLoading(false);
        });
    }, []);

    return { user, loading };
}