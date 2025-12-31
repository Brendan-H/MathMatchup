import Header from "@/components/Header";
import Navbar from "@/components/Navbar";
import { Button } from "@/components/ui/button";
import Link from "next/link";

export default function EducationPage() {
    return (
        <div>
            <Header/>
            <Navbar/>

            <main className="mx-auto max-w-5xl px-6 py-16 space-y-16">
                <section className="text-center space-y-4">
                    <h1 className="text-4xl font-bold">
                        MathMatchup for Schools
                    </h1>
                    <p className="text-lg text-muted-foreground">
                        A classroom-first math game designed to keep every student engaged.
                    </p>
                </section>
                <section className="grid md:grid-cols-3 gap-8">
                    <div>
                        <h3 className="text-xl font-semibold mb-2">
                            Unlimited Classroom Games
                        </h3>
                        <p className="text-muted-foreground">
                            Run as many games as you want with any class size.
                        </p>
                    </div>

                    <div>
                        <h3 className="text-xl font-semibold mb-2">
                            Built-In Analytics
                        </h3>
                        <p className="text-muted-foreground">
                            Review class-wide and solo stats to see who needs more help.
                        </p>
                    </div>

                    <div>
                        <h3 className="text-xl font-semibold mb-2">
                            Zero Student Setup
                        </h3>
                        <p className="text-muted-foreground">
                            Students join instantly through the app or website using a code.
                        </p>
                    </div>
                </section>
                <section className="text-center space-y-6">
                    <p className="text-muted-foreground">
                        Licenses are priced per teacher and scale automatically for schools
                        of all sizes.
                    </p>

                    <Button size="lg" asChild>
                        <Link href="/education/pricing">
                            View Education Pricing
                        </Link>
                    </Button>
                </section>
            </main>
        </div>
    );
}