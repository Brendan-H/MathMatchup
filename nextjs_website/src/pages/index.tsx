import Head from 'next/head';
import Navbar from '../components/Navbar';
import Header from "../components/Header";

export default function Home() {
    return (
        <div>
            <Head>
                <title>Welcome To MathMatchup</title>
            </Head>
            <Header />
            <Navbar />
            <main style={styles.main}>
            </main>
        </div>
    );
}

const styles = {
    main: {
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        height: '100vh',
        backgroundColor: '#f0f0f0',
    },
};