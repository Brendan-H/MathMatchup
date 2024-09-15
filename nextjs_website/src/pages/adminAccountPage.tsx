import Head from 'next/head';
import Navbar from '../components/Navbar';
import CreateAccountForm from '../components/CreateAccountForm';

export default function AdminAccountPage() {
    return (
        <div>
            <Head>
                <title>MathMatchup</title>
            </Head>
            <Navbar />
            <main style={styles.main}>
                <CreateAccountForm />
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