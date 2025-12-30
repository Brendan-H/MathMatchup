import React from 'react';
import Image from 'next/image';
import mathmatchuplogo from '../../public/images/mathmatchuplogo.png';


export default function Header() {
    return (
        <header className="bg-primary text-primary-foreground">
            <div className="mx-auto max-w-6xl px-6 py-16 flex items-center gap-10">
                <div className="rounded-full bg-white p-3 overflow-hidden">
                    <Image
                        src={mathmatchuplogo}
                        alt="MathMatchup Logo"
                        width={160}
                        height={160}
                    />
                </div>

                <div>
                    <h2 className="text-2xl font-medium opacity-90">
                        Welcome to
                    </h2>
                    <h1 className="text-5xl font-bold leading-tight">
                        MathMatchup
                    </h1>
                    <p className="mt-2 text-lg opacity-80">
                        The math quiz app with hidden partners
                    </p>
                </div>
            </div>
        </header>
    );
}
