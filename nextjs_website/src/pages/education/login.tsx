import Head from "next/head";
import Navbar from "@/components/Navbar";
import Header from "@/components/Header";


export default function Login() {
    return (
        <div>
            <Head>
                <title>MathMatchup</title>
            </Head>
            <Header />
            <Navbar />
            <p>Log in</p>
        </div>
    );
}