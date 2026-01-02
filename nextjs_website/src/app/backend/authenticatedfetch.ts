import {getAuth} from "firebase/auth";
import firebase_app from "@/firebase/config";


export async function authenticatedfetch(url:string, options:RequestInit = {}) {
    const auth = getAuth(firebase_app);
    const user = auth.currentUser;

    if (!user) {
        throw new Error("User not authenticated");
    }

    const token = await user.getIdToken();

    return fetch(url, {
        ...options,
        headers: {
            ...(options.headers || {}),
            Authorization: `Bearer ${token}`,
        },
    })

}