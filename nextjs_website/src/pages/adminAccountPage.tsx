import Head from 'next/head';
import Navbar from '../components/Navbar';
import CreateAccountForm from '../components/CreateAccountForm';
import { colors } from '@/styles/colors';

export default function AdminAccountPage() {
    return (
        <div style={styles.pageContainer}>
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
    pageContainer: {
        width: '100%',
        height: '100%',
        backgroundColor: colors.appBarColor,
    },
    main: {
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        height: '100vh',
        backgroundColor: colors.appBarColor,
    },
};