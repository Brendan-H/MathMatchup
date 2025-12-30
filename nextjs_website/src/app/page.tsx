import Navbar from '../components/Navbar';
import Header from "../components/Header";
import {Button} from "@/components/ui/button";
import Link from "next/link";


export default function HomePage() {
    return (
        <>
            <Header />
            <Navbar />

            <main className="mx-auto max-w-6xl px-6 py-16 text-center space-y-20">

                <section className="space-y-6">
                    <h1 className="text-5xl font-bold leading-tight">
                        A Math Game Where<br />Everyone Has to Think
                    </h1>

                    <p className="mx-auto max-w-2xl text-lg text-muted-foreground">
                        MathMatchup is a collaborative math quiz game where students are
                        secretly paired together. Everyone answers independently, scores
                        are combined, and the winning team is revealed at the end.
                    </p>

                    <div className="flex justify-center gap-4 pt-4">
                        <Button size="lg" asChild>
                            <Link href="/pricing">View Pricing</Link>
                        </Button>

                        <Button size="lg" variant="outline" asChild>
                            <a href="https://mathmatchupapp.brendanharan.com">
                                Play Free
                            </a>
                        </Button>
                    </div>
                </section>

                <section className="grid md:grid-cols-3 gap-10 text-left">
                    <div>
                        <h3 className="text-xl font-semibold mb-2">
                            Hidden Teammates
                        </h3>
                        <p className="text-muted-foreground">
                            Students don’t know who their teammate is until the game ends,
                            eliminating freeloading and encouraging full participation.
                        </p>
                    </div>

                    <div>
                        <h3 className="text-xl font-semibold mb-2">
                            Fair, Scaled Scoring
                        </h3>
                        <p className="text-muted-foreground">
                            Odd number of players? No problem! Teams of three are automatically adjusted so every class stays
                            competitive and fair.
                        </p>
                    </div>

                    <div>
                        <h3 className="text-xl font-semibold mb-2">
                            Teacher-First Design
                        </h3>
                        <p className="text-muted-foreground">
                            Built for classrooms with real-time updates, analytics, and zero
                            ads or distractions. Students will feel right at home if they've used other classroom quiz apps.
                        </p>
                    </div>
                </section>

                <section className="space-y-6">
                    <h2 className="text-3xl font-bold">
                        Built for Classrooms, Families, and Students
                    </h2>

                    <div className="grid md:grid-cols-3 gap-8 text-left">
                        <div>
                            <h3 className="text-xl font-semibold mb-2">Students</h3>
                            <p className="text-muted-foreground">
                                Practice math in a fun, competitive way at school or at home.
                            </p>
                        </div>

                        <div>
                            <h3 className="text-xl font-semibold mb-2">Parents</h3>
                            <p className="text-muted-foreground">
                                Start games and track your child’s progress with no ads.
                            </p>
                        </div>

                        <div>
                            <h3 className="text-xl font-semibold mb-2">Teachers</h3>
                            <p className="text-muted-foreground">
                                Run engaging games, analyze results, and keep students involved.
                            </p>
                        </div>
                    </div>
                </section>

                <section className="space-y-4">
                    <h2 className="text-3xl font-bold">
                        Ready to Try MathMatchup?
                    </h2>
                    <p className="text-muted-foreground">
                        Get started in minutes—no setup required for students.
                    </p>

                    <Button size="lg" asChild>
                        <Link href="/pricing">Get Started</Link>
                    </Button>
                </section>

            </main>
        </>
    );
}

// export default function HomePage() {
//     return (
//         <div>
//             <Header />
//             <Navbar />
//             <div style={{ textAlign: 'center' }}>
//                 <h1>About</h1>
//                 <p>Players join the game and are automatically separated into teams of 2 or, if needed, 3.
//                     The only catch is that they don't know their teammate.
//                     They then have to answer questions to get points, which get added together with their partner's points at the end.
//                     Teammates are revealed and the partnership with the most points wins!</p>
//             </div>
//             <main>
//             </main>
//         </div>
//     );
// }

// const styles = {
//     main: {
//         display: 'flex',
//         justifyContent: 'center',
//         alignItems: 'center',
//         height: '100vh',
//         backgroundColor: '#f0f0f0',
//     },
//     text: {
//         textAlign: 'center',
//         fontSize: '20 px',
//     }
// };