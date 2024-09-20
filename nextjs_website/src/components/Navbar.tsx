import React from 'react';
import { useRouter } from 'next/router';
import { Url } from 'next/dist/shared/lib/router/router';
import { colors } from '../styles/colors';

const Navbar = () => {
    const router = useRouter();

    const handleNavigation = (path: Url) => {
        router.push(path);
    };

    return (
        <nav style={styles.navbar}>
            <button onClick={() => handleNavigation('/')} style={styles.button}>
                <span style={styles.text}>Home</span>
            </button>
            <button onClick={() => handleNavigation('/about')} style={styles.button}>
                <span style={styles.text}>About</span>
            </button>
            <button onClick={() => handleNavigation('/screenshots')} style={styles.button}>
                <span style={styles.text}>Screenshots</span>
            </button>
            <button onClick={() => handleNavigation('/pricingPage')} style={styles.button}>
                <span style={styles.text}>Pricing</span>
            </button>
            <button onClick={() => handleNavigation('/contact')} style={styles.button}>
                <span style={styles.text}>Contact</span>
            </button>
        </nav>
    );
};

const styles = {
    navbar: {
        display: 'flex',
        justifyContent: 'center',
        backgroundColor: colors.primaryContainer,
        padding: '10px',
    },
    button: {
        margin: '0 10px',
        padding: '10px 20px',
        borderRadius: '5px',
        border: 'none',
        backgroundColor: colors.primaryContainer,
        cursor: 'pointer',
    //    color: '#fff',
        transition: 'background-color 0.3s',
    },
    text: {
        fontSize: '20px',
    }
};

export default Navbar;