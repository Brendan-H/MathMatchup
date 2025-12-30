"use client";

import React from 'react';
import { useRouter } from 'next/navigation';

export default function Navbar() {
    const router = useRouter();

    const links = [
        { label: "Home", href: "/" },
        { label: "About", href: "/about" },
        { label: "Screenshots", href: "/screenshots" },
        { label: "Pricing", href: "/pricing" },
        { label: "Contact", href: "/contact" },
    ];

    return (
        <nav className="bg-primary text-primary-foreground">
            <div className="mx-auto max-w-6xl flex justify-center gap-8 py-4">
                {links.map((link) => (
                    <button
                        key={link.href}
                        onClick={() => router.push(link.href)}
                        className="px-3 py-2 text-lg font-medium hover:underline underline-offset-4"
                    >
                        {link.label}
                    </button>
                ))}
            </div>
        </nav>
    );
}

// const styles = {
//     navbar: {
//         display: 'flex',
//         justifyContent: 'center',
//         backgroundColor: colors.primaryContainer,
//         padding: '10px',
//     },
//     button: {
//         margin: '0 10px',
//         padding: '10px 20px',
//         borderRadius: '5px',
//         border: 'none',
//         backgroundColor: colors.primaryContainer,
//         cursor: 'pointer',
//     //    color: '#fff',
//         transition: 'background-color 0.3s',
//     },
//     text: {
//         fontSize: '20px',
//     }
// };
