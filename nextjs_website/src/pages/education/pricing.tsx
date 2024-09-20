import { useState, useEffect } from 'react';
import { useRouter } from 'next/router';
import Head from 'next/head';
import Header from '@/components/Header';
import Navbar from '@/components/Navbar';
import { colors } from '@/styles/colors';

const EducationPricingPage = () => {
    const [sliderValue, setSliderValue] = useState(1);
    const [costPerTeacher, setCostPerTeacher] = useState(2.99);
    const [number, setNumber] = useState('');
    const router = useRouter();

    useEffect(() => {
        calculateCost();
    }, [sliderValue]);

    const calculateCost = () => {
        if (sliderValue <= 250) {
            setCostPerTeacher(2.99);
        } else if (sliderValue <= 500) {
            setCostPerTeacher(2.85);
        } else {
            setCostPerTeacher(2.75);
        }
    };

    const handleSliderChange = (value: number) => {
        setSliderValue(value);
        calculateCost();
    };

    const handleNumberChange = (value: string) => {
        const parsedValue = parseInt(value, 10);
        setSliderValue(isNaN(parsedValue) ? 1 : parsedValue);
        setNumber(value);
        calculateCost();
    };
    return (
        <div>
            <Head>
                <title>Education Pricing</title>
            </Head>
            <Header />
            <Navbar />
            <div style={styles.container}>
                <div style={styles.column}>
                    <input
                        type="range"
                        min="1"
                        max="1000"
                        value={sliderValue}
                        onChange={(e) => handleSliderChange(parseInt(e.target.value, 10))}
                        style={styles.slider}
                        placeholder='Number of teachers'
                    />
                    <input
                        type="number"
                        value={number}
                        onChange={(e) => handleNumberChange(e.target.value)}
                        style={styles.input}
                        maxLength={4}
                    />
                    <p>Number of teachers: {sliderValue}</p>
                    <p>Cost per teacher: ${costPerTeacher.toFixed(2)} per month</p>
                    <p>Total cost per month: ${(costPerTeacher * sliderValue).toFixed(2)} per month</p>
                </div>
                <div style={styles.column}>
                    <p>That's less than a cup of coffee per teacher per month!
                        Purchasing a license helps us keep MathMatchup 100% ad-free and allows us to continue to develop new features and content!
                        Your license will also give you access to in-depth analysis of every game, allowing you to track progress.
                        The best part? Students love playing MathMatchup!
                        The unique structure of MathMatchup makes students work harder rather than relying on their partner to do all the work.
                        Students are more engaged and more likely to retain the information they learn.
                        MathMatchup is the best way to supplement your curriculum and keep students learning!</p>
                    <p>Ready to get started?</p>
                    <button onClick={() => router.push('/education/login')} style={styles.button}>
                        Purchase a license now!
                    </button>
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
    },
    column: {
        flex: 1,
        padding: '10px',
    },
    slider: {
        width: '100%',
        margin: '10px 0',
    },
    input: {
        width: '90%',
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

export default EducationPricingPage;