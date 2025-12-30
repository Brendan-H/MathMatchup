import Header from "@/components/Header";
import Navbar from "@/components/Navbar";

export default function ContactPage() {
    return (
        <>
            <Header />
            <Navbar />

            <main className="mx-auto max-w-3xl px-6 py-16 text-center space-y-8">
                <h1 className="text-4xl font-bold">Contact</h1>

                <p className="text-lg text-muted-foreground">
                    Questions about MathMatchup?
                </p>

                <p className="text-muted-foreground">
                    Reach out anytime and we’ll get back to you as soon as possible.
                </p>

                <div className="text-lg font-medium">
                    mathmatchup@brendanharan.com
                </div>
            </main>
        </>
    );
}