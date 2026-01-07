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
                </div>
                {/*//TODO something that shows an example question with those selected things*/}
            </main>
        </>
    );
}