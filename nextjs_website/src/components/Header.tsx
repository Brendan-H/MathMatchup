import React from 'react';
import Image from 'next/image';
import { colors } from '../styles/colors';
import mathmatchuplogo from '../../public/images/mathmatchuplogo.png';

const Header: React.FC = () => {
    return (
        <div style={styles.container}>
            <div style={styles.padding}>
                <div style={styles.row}>
                    <div style={styles.imageContainer}>
                        <Image src={mathmatchuplogo} alt="MathMatchup Logo" height={250} width={250} />
                    </div>
                    <div style={styles.spacer}></div>
                    <div>
                        <div style={styles.column}>
                            <h2 style={styles.h2}>Welcome To</h2>
                            <h1 style={styles.h1}>MathMatchup</h1>
                            <h3 style={styles.h3}>The math quiz app with hidden partners</h3>
                        </div>
                    </div>
                </div>
                <div style={styles.spacerVertical}></div>
            </div>
        </div>
    );
};

const styles = {
    container: {
        backgroundColor: colors.primaryContainer,
    },
    padding: {
        padding: '40px 0 20px 0',
    },
    row: {
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
    },
    imageContainer: {
        borderRadius: '95%',
        overflow: 'hidden',
    },
    spacer: {
        width: '50px',
    },
    column: {
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        textAlign: 'center',
    },
    spacerVertical: {
        height: '10px',
    },
    h1: {
        fontSize: '56px',
        margin: '0 auto',
    },
    h2: {
        fontSize: '40px',
        margin: '0 auto',
    },
    h3: {
        fontSize: '25px',
        margin: '0 auto',
    }
};

export default Header;