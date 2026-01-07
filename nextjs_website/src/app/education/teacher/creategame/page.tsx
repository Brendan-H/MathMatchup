import Navbar from "@/components/Navbar";
import Header from "@/components/Header";
import React from "react";

export default function TeacherCreateGamePage() {
    return (
        <>
            <Header />
            <Navbar />
            <main className="mx-auto max-w-5xl p-8 space-y-8">
                <h1 className="text-2xl font-bold text-center">Create a New Game</h1>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
                    <div className="border rounded-lg p-6 space-y-3 items-center text-left">
                        <h2 className="text-xl font-semibold">Create Game</h2>
                        <p>Question Type</p>
                        <select
                            className="w-full p-3 border rounded bg-white"
                            aria-label="Question Type"
                        >
                            <option value="" disabled>
                                Select Question Type
                            </option>
                            <option value="addition">Addition</option>
                            <option value="subtraction">Subtraction</option>
                            <option value="multiplication">Multiplication</option>
                            <option value="division">Division</option>
                        </select>
                        <p>Difficulty</p>
                        <select
                            className="w-full p-3 border rounded bg-white"
                            aria-label="Difficulty"
                        >
                            <option value="" disabled>
                                Select Difficulty
                            </option>
                            <option value="Easy">Easy</option>
                            <option value="Medium">Medium</option>
                            <option value="Hard">Hard</option>
                            <option value="Impossible">Impossible</option>
                        </select>
                        <p>Time Limit</p>
                        <select
                            className="w-full p-3 border rounded bg-white"
                            aria-label="Time Limit"
                        >
                            <option value="" disabled>
                                Select Time Limit
                            </option>
                            <option value="1min">1 Minute</option>
                            <option value="2min">2 Minutes</option>
                            <option value="5min">5 Minutes</option>
                            <option value="10min">10 Minutes</option>
                        </select>
                        <div className="pt-3">
                            <button
                                className="w-full mt-4 px-4 py-4 rounded-md bg-primary text-primary-foreground font-medium hover:opacity-90 transition"
                            >
                                Create Game
                            </button>
                        </div>

                    </div>
                    <div className="border rounded-xl p-6 bg-muted/40 flex flex-col justify-between">
                        <div className="space-y-3">
                            <h2 className="text-xl font-semibold">
                                Example Questions
                            </h2>
                            {/*//TODO make them autogenerate from settings. Current generation is all in app so have to bring over somehow*/}
                            <p className="text-muted-foreground text-sm">
                                This is a preview of questions with your settings.
                            </p>
                            <div className="mt-4 p-4 border rounded-lg bg-background text-center space-y-2">
                                <div className="text-lg font-semibold">
                                    7 × 8 = ?
                                </div>
                            </div>
                            <div className="mt-4 p-4 border rounded-lg bg-background text-center space-y-2">
                                <div className="text-lg font-semibold">
                                    11 × 3 = ?
                                </div>
                            </div>
                            <div className="mt-4 p-4 border rounded-lg bg-background text-center space-y-2">
                                <div className="text-lg font-semibold">
                                    2 × 9 = ?
                                </div>
                            </div>
                            <div className="mt-4 p-4 border rounded-lg bg-background text-center space-y-2">
                                <div className="text-lg font-semibold">
                                    6 × 7 = ?
                                </div>
                            </div>
                            <p className="text-muted-foreground text-sm">
                                Note: These are NOT the exact questions students will receive.
                                Difficulty will be consistent across students, but numbers will vary.
                                Students will see questions generated with the exact same settings as the questions above.
                            </p>
                        </div>

                    </div>
                </div>

                {/*//TODO something that shows an example question with those selected things*/}
            </main>
        </>
    );
}