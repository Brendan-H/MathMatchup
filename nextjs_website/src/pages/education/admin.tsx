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
                </div>
                <div style={styles.section}>
                    <h2>View Teachers</h2>
                    <ul>
                        <li>Teacher one</li>
                        <li>Teacher two</li>
                    </ul>
                    <div style={styles.section}>
                        <h2>Need to add a teacher to your license?</h2>
                        <p>Do so here</p>
                        <button style={styles.button}>Add Teacher</button>
                    </div>
                    <div style={styles.section}>
                        <h2>Just starting out?</h2>
                        <p>Upload your teachers via CSV</p>
                        <button style={styles.button}>Upload CSV</button>
                    </div>
                </div>
            </div>
        </div>
    );
};

const styles = {
    container: {
        display: 'flex' as const,
        flexDirection: 'column' as const,
        padding: '20px',
    },
    section: {
        marginBottom: '20px',
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