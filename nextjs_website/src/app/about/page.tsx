import Header from "@/components/Header";
import Navbar from "@/components/Navbar";

export default function AboutPage() {
    return (
        <>
            <Header />
            <Navbar />
            <main className="mx-auto max-w-4xl p-8 text-center">
                <h1 className="text-3xl font-bold mb-4">About</h1>
                <p className="text-lg text-muted-foreground">
                    Players join the game and are automatically separated into teams of 2
                    (or 3 if needed). The only catch? They don't know their teammate!
                    Teammates are hidden until the end, and the team
                    with the most combined points (adjusted for team size) wins!
                </p>
            </main>
        </>
    );
}