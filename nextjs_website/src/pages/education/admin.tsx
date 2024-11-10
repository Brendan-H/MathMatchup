import { useState, useEffect } from 'react';
import Head from 'next/head';
import Header from '@/components/Header';
import Navbar from '@/components/Navbar';
import { colors } from '@/styles/colors';

const AdminHomePage = () => {
    const [licenses, setLicenses] = useState([]);
    const [teachers, setTeachers] = useState([]);

    useEffect(() => {
        fetchLicenses();
        fetchTeachers();
    }, []);

    const fetchLicenses = async () => {
        try {
            const response = await fetch('/api/licenses');
            const data = await response.json();
            setLicenses(data);
        } catch (error) {
            console.error('Error fetching licenses:', error);
        }
    };

    const fetchTeachers = async () => {
        try {
            const response = await fetch('/api/teachers');
            const data = await response.json();
            setTeachers(data);
        } catch (error) {
            console.error('Error fetching teachers:', error);
        }
    };

    return (
        <div>
            <Head>
                <title>Admin Home - MathMatchup</title>
            </Head>
            <Header />
            <Navbar />
            <div style={styles.container}>
                <div style={styles.section}>
                    <h2>Your License</h2>
                    <p>100 Teachers</p>
                    <p>$299.99 monthly</p>
                    <p>$2.99 per teacher</p>
                    <p>Renews: 12/31/2024</p>
                </div>
                <div style={styles.section}>
                    <h2>View Teachers on Your License</h2>
                    <ul>
                        <li>Teacher one</li>
                        <li>Teacher two</li>
                    </ul>
                    <div style={styles.minicontainer}>
                        <div style={styles.noshadowsection}>
                            <h2>Need to add a teacher to your license?</h2>
                            <p>Do so here</p>
                            <button style={styles.button}>Add Teacher</button>
                        </div>
                        <div style={styles.noshadowsection}>
                            <h2>Just starting out?</h2>
                            <p>Upload your teachers via CSV</p>
                            <button style={styles.button}>Upload CSV</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

const styles = {
    container: {
        display: 'flex' as const,
        flexDirection: 'row' as const,
        padding: '20px',
        backgroundColor: colors.appBarColor,
        justifyContent: 'space-around',
    },
    minicontainer: {
        display: 'flex' as const,
        flexDirection: 'row' as const,
        padding: '20px',
        backgroundColor: colors.primaryContainer,
        justifyContent: 'space-around',
    },
    noshadowsection: {
        marginBottom: '20px',
        padding: '20px',
        backgroundColor: colors.primaryContainer,
        borderRadius: '10px',
        width: '45%',
    },
    section: {
        marginBottom: '20px',
        padding: '20px',
        backgroundColor: colors.primaryContainer,
        borderRadius: '10px',
        boxShadow: '0 4px 8px rgba(0, 0, 0, 0.1)',
        width: '45%',
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

export default AdminHomePage;