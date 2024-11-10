import { useState } from 'react';
import { useRouter } from 'next/router';
import Head from 'next/head';
import Header from '@/components/Header';
import Navbar from '@/components/Navbar';
import { colors } from '@/styles/colors';
import createUser from "@/firebase/auth/createUser";

const AdminAccountPage = () => {
    const [obscurePassword, setObscurePassword] = useState(true);
    const [obscureConfirmPassword, setObscureConfirmPassword] = useState(true);
    const [createEmail, setCreateEmail] = useState('');
    const [name, setName] = useState('');
    const [role, setRole] = useState('');
    const [school, setSchool] = useState('');
    const [createPassword, setCreatePassword] = useState('');
    const [confirmCreatePassword, setConfirmCreatePassword] = useState('');
    const [loginEmail, setLoginEmail] = useState('');
    const [loginPassword, setLoginPassword] = useState('');
    const router = useRouter();

    const handleCreateAccount = async () => {
        try {
            if (createPassword !== confirmCreatePassword) {
                alert('Passwords do not match');
                return;
            } else if (createPassword.length < 6) {
                alert('Password must be at least 6 characters');
                return;
            } else if (createEmail === '' || name === '' || role === '' || school === '') {
                alert('All fields are required');
                return;
            }
            await createUser(createEmail, createPassword);
            router.push('/');
        } catch (error) {
            console.error(error);
        }
    };
    const handleLogin = async () => {
        try {
            if (loginEmail === '' || loginPassword === '') {
                alert('All fields are required');
                return;
            }
            await createUser(loginEmail, loginPassword);
            router.push('/education/admin');
        } catch (error) {
            console.error(error);
        }
    }
    return (
        <div>
            <Head>
                <title>MathMatchup</title>
            </Head>
            <Header />
            <Navbar />
            <div style={styles.container}>
                <div style={styles.smallContainer}>
                    <h2>Create Account</h2>
                    <p>Create your organization&apos;s main administrator account</p>
                    <input
                        type="email"
                        placeholder="Email"
                        value={createEmail}
                        onChange={(e) => setCreateEmail(e.target.value)}
                        style={styles.input}
                    />
                    <input
                        type="text"
                        placeholder="Full Name"
                        value={name}
                        onChange={(e) => setName(e.target.value)}
                        style={styles.input}
                    />
                    <input
                        type="text"
                        placeholder="School Name"
                        value={school}
                        onChange={(e) => setSchool(e.target.value)}
                        style={styles.input}
                    />
                    <input
                        type="text"
                        placeholder="Role in School (e.g., Principal, Tech Lead)"
                        value={role}
                        onChange={(e) => setRole(e.target.value)}
                        style={styles.input}
                    />
                    <input
                        type={obscurePassword ? 'password' : 'text'}
                        placeholder="Password"
                        value={createPassword}
                        onChange={(e) => setCreatePassword(e.target.value)}
                        style={styles.input}
                    />
                    <button onClick={() => setObscurePassword(!obscurePassword)}>
                        {obscurePassword ? 'Show' : 'Hide'}
                    </button>
                    <input
                        type={obscureConfirmPassword ? 'password' : 'text'}
                        placeholder="Confirm Password"
                        value={confirmCreatePassword}
                        onChange={(e) => setConfirmCreatePassword(e.target.value)}
                        style={styles.input}
                    />
                    <button onClick={() => setObscureConfirmPassword(!obscureConfirmPassword)}>
                        {obscureConfirmPassword ? 'Show' : 'Hide'}
                    </button>
                    <button style={styles.button} onClick={handleCreateAccount}>
                        Create Account
                    </button>
                </div>
                <div style={styles.smallContainer}>
                    <h2>Login</h2>
                    <p>Login to your organization&apos;s main administrator account</p>
                    <input
                        type="email"
                        placeholder="Email"
                        value={loginEmail}
                        onChange={(e) => setLoginEmail(e.target.value)}
                        style={styles.input}
                    />
                    <input
                        type={obscurePassword ? 'password' : 'text'}
                        placeholder="Password"
                        value={loginPassword}
                        onChange={(e) => setLoginPassword(e.target.value)}
                        style={styles.input}
                    />
                    <button onClick={() => setObscurePassword(!obscurePassword)}>
                        {obscurePassword ? 'Show' : 'Hide'}
                    </button>
                    <button onClick={handleLogin} style={styles.button}>
                        Login
                    </button>
                </div>
            </div>
        </div>
    );
};

const styles = {
    container: {
        backgroundColor: colors.appBarColor,
        display: 'flex' as const,
        flexDirection: 'row' as const,
        padding: '20px',
        justifyContent: 'space-around',
    },
    smallContainer: {
        backgroundColor: colors.primaryContainer,
        padding: '20px',
        borderRadius: '10px',
        boxShadow: '0 4px 8px rgba(0, 0, 0, 0.1)',
        width: '45%',
    },
    column: {
        flex: 1,
        padding: '10px',
    },
    input: {
        width: '100%',
        padding: '10px',
        margin: '10px 0',
    },
    button: {
        padding: '10px 20px',
        backgroundColor: colors.primary,
        color: '#fff',
        border: 'none',
        borderRadius: '5px',
        cursor: 'pointer',
    },
};

export default AdminAccountPage;