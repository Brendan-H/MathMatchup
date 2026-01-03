import { sendPasswordResetEmail } from "firebase/auth";

import { getAuth } from "firebase/auth";
import firebase_app from "@/firebase/config";

export async function resetPassword(email: string): Promise<void> {
    const auth = getAuth(firebase_app);
    await sendPasswordResetEmail(auth, email);
}