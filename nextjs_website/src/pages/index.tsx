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
            <div style={{ textAlign: 'center' }}>
                <h1>About</h1>
                <p>Players join the game and are automatically separated into teams of 2 or, if needed, 3.
                    The only catch is that they don't know their teammate.
                    They then have to answer questions to get points, which get added together with their partner's points at the end.
                    Teammates are revealed and the partnership with the most points wins!</p>
            </div>
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
    text: {
        textAlign: 'center',
        fontSize: '20 px',
    }
};