import { initializeApp, getApps } from "firebase/app";

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: "AIzaSyDw088cLyYAX27KOLNYnWCD77XnoSq6tJs",
    authDomain: "mathmatchup.firebaseapp.com",
    projectId: "mathmatchup",
    storageBucket: "mathmatchup.appspot.com",
    messagingSenderId: "836962932399",
    appId: "1:836962932399:web:1d007c9ae3abba15ca265a",
    measurementId: "G-2LM0J5PYLJ"
};

let firebase_app = getApps().length === 0 ? initializeApp(firebaseConfig) : getApps()[0];

export default firebase_app;