"use client";

import Header from "@/components/Header";
import Navbar from "@/components/Navbar";
import { Button } from "@/components/ui/button";
import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";

export default function EducationPricingPage() {
    const [teachers, setTeachers] = useState(25);
    const [price, setPrice] = useState(2.99);
    const router = useRouter();

    useEffect(() => {
        if (teachers <= 100) setPrice(2.99);
        else if (teachers <= 300) setPrice(2.85);
        else setPrice(2.75);
    }, [teachers]);

    return (
        <>
            <Header />
            <Navbar />

            <main className="mx-auto max-w-4xl px-6 py-16 space-y-12">

                <section className="text-center space-y-4">
                    <h1 className="text-4xl font-bold">
                        Education Pricing
                    </h1>
                    <p className="text-muted-foreground">
                        Simple, transparent pricing for schools. Any questions? Contact us.
                    </p>
                </section>

                <section className="space-y-6">
                    <input
                        type="range"
                        min={1}
                        max={1000}
                        value={teachers}
                        onChange={(e) => setTeachers(Number(e.target.value))}
                        className="w-full"
                    />

                    <div className="text-center space-y-2">
                        <p className="text-lg">
                            {teachers} teachers
                        </p>
                        <p className="text-muted-foreground">
                            ${price.toFixed(2)} per teacher / month
                        </p>
                        <p className="text-xl font-semibold">
                            ${(teachers * price).toFixed(2)} / month total
                        </p>
                    </div>
                </section>

                <section className="text-center">
                    <Button size="lg" onClick={() => router.push("/education/signup")}>
                        Create School Account
                    </Button>
                </section>
                <section className="text-center space-y-4">
                    <p className="text-muted-foreground">
                       We strive to make MathMatchup affordable for all schools.
                        If your school has budget constraints that don't fit the pricing above, contact us!
                    </p>
                </section>

            </main>
        </>
    );
}
