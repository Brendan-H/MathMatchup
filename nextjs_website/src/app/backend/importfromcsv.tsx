import { getAuth } from "firebase/auth";
import firebase_app from "@/firebase/config";


export default async function importFromCsv(file: string | Blob, schoolID: number, school: string) {
    const auth = getAuth(firebase_app);


    // @ts-ignore
    const idToken = await auth.currentUser.getIdToken(true);

    const formData = new FormData();
    formData.append('usersCSV', file);
    const response = await fetch('http://localhost:8080/users/bulkcreate', {
        method: 'POST',
        // headers: {
        //     Authorization: `Bearer ${idToken}`,
        //     'schoolID': schoolID,
        //     'school': school,
        // },
        body: formData,
    });
    const data = await response.json();
    return data;
}