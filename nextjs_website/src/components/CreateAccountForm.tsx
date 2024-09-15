import React, { useState, CSSProperties } from 'react';

const CreateAccountForm = () => {
    const [formData, setFormData] = useState({
        email: '',
        fullName: '',
        schoolName: '',
        role: '',
        password: '',
        confirmPassword: '',
    });

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        const { name, value } = e.target;
        setFormData({ ...formData, [name]: value });
    };

    const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
        // Handle form submission
    };

    const styles: { [key: string]: CSSProperties } = {
        container: {
            border: '1px solid #0070f3',
            borderRadius: '10px',
            padding: '20px',
            maxWidth: '400px',
            margin: 'auto',
            backgroundColor: '#f0f0f0',
        },
        form: {
            display: 'flex',
            flexDirection: 'column',
        },
        input: {
            marginBottom: '10px',
            padding: '10px',
            borderRadius: '5px',
            border: '1px solid #ccc',
        },
        button: {
            padding: '10px',
            borderRadius: '10px',
            border: 'none',
            backgroundColor: '#0070f3',
            color: '#fff',
            cursor: 'pointer',
        },
    };

    return (
        <div style={styles.container}>
            <h2>Create Account</h2>
            <p>Create your organization's main administrator account</p>
            <form onSubmit={handleSubmit} style={styles.form}>
                <input
                    type="email"
                    name="email"
                    placeholder="Email"
                    value={formData.email}
                    onChange={handleChange}
                    style={styles.input}
                />
                <input
                    type="text"
                    name="fullName"
                    placeholder="Full Name"
                    value={formData.fullName}
                    onChange={handleChange}
                    style={styles.input}
                />
                <input
                    type="text"
                    name="schoolName"
                    placeholder="School Name"
                    value={formData.schoolName}
                    onChange={handleChange}
                    style={styles.input}
                />
                <input
                    type="text"
                    name="role"
                    placeholder="Role in School"
                    value={formData.role}
                    onChange={handleChange}
                    style={styles.input}
                />
                <input
                    type="password"
                    name="password"
                    placeholder="Password"
                    value={formData.password}
                    onChange={handleChange}
                    style={styles.input}
                />
                <input
                    type="password"
                    name="confirmPassword"
                    placeholder="Confirm Password"
                    value={formData.confirmPassword}
                    onChange={handleChange}
                    style={styles.input}
                />
                <button type="submit" style={styles.button}>Create Account</button>
            </form>
        </div>
    );
};

export default CreateAccountForm;