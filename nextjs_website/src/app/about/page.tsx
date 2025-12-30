import Header from "@/components/Header";
import Navbar from "@/components/Navbar";

export default function AboutPage() {
    return (
        <>
            <Header />
            <Navbar />

            <main className="mx-auto max-w-4xl px-6 py-16 space-y-16">

                <section className="text-center space-y-4">
                    <h1 className="text-4xl font-bold">About MathMatchup</h1>
                    <p className="text-lg text-muted-foreground">
                        MathMatchup was built to solve a simple classroom problem: making
                        group work fair, engaging, and effective.
                    </p>
                </section>

                <section className="space-y-6">
                    <p className="text-muted-foreground">
                        In many classroom games and group activities, students quickly
                        fall into familiar roles: one student answers everything while others coast.
                        Pairing up with "the smart kid" becomes a go-to strategy.
                        MathMatchup approaches collaboration differently.
                    </p>

                    <p className="text-muted-foreground">
                        Students are paired into teams without knowing who their teammate
                        is. Everyone answers every question independently, and scores are
                        combined only at the end. This structure encourages full
                        participation while still keeping the excitement of teamwork.
                        In fact, waiting for teammates to be revealed can be even more exciting!
                    </p>

                    <p className="text-muted-foreground">
                        The result is a game where every student contributes. No longer do shy students dread group games
                        or hardworking students feel used. MathMatchup ensures that all students can enjoy collaborative learning.
                    </p>
                </section>

                <section className="grid md:grid-cols-3 gap-8">
                    <div>
                        <h3 className="text-xl font-semibold mb-2">
                            Designed for Classrooms
                        </h3>
                        <p className="text-muted-foreground">
                            Students can watch teams progress in real-time on the teacher's projected screen, making it easy to keep everyone engaged. The only question is: who is on which team?
                        </p>
                    </div>

                    <div>
                        <h3 className="text-xl font-semibold mb-2">
                            Fair by Design
                        </h3>
                        <p className="text-muted-foreground">
                            With MathMatchup, <b>everyone</b> has a teammate. In the case of an odd number of students,
                            the team of three is automatically scaled to ensure no one has an unfair advantage.
                        </p>
                    </div>

                    <div>
                        <h3 className="text-xl font-semibold mb-2">
                            No Distractions
                        </h3>
                        <p className="text-muted-foreground">
                            MathMatchup is ad-free and focused entirely on learning and
                            engagement. There is no fluff...just fun, team-based learning.
                        </p>
                    </div>
                </section>

            </main>
        </>
    );
}
