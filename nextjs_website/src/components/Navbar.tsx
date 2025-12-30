import React from 'react';
import Link from "next/link";

export default function Navbar() {

    const links = [
        { label: "Home", href: "/" },
        { label: "About", href: "/about" },
     //   { label: "Screenshots", href: "/screenshots" }, // TODO: Add screenshots page
        { label: "Pricing", href: "/pricing" },
        { label: "Contact", href: "/contact" },
    ];

    return (
        <nav className="bg-primary text-primary-foreground">
            <div className="mx-auto max-w-6xl flex justify-center gap-8 py-4">
                {links.map((link) => (
                    <Link
                        key={link.href}
                        href={link.href}
                        className="px-3 py-2 text-lg font-medium hover:underline underline-offset-4"
                    >
                        {link.label}
                    </Link>
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
