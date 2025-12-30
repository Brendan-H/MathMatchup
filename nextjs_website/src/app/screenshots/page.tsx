import Header from "@/components/Header";
import Navbar from "@/components/Navbar";

export default function ScreenshotsPage() {
    return (
        <div>
            <Header />
            <Navbar />
            <main className="mx-auto max-w-6xl p-8">
                <h1 className="text-4xl font-bold mb-2">Screenshots</h1>
                <p className="text-muted-foreground mb-8">
                    Screenshots page
                </p>
            </main>
        </div>
    );
}