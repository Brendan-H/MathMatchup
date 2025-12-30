import Navbar from '../components/Navbar';
import Header from "../components/Header";

export default function HomePage() {
    return (
        <>
            <Header />
            <Navbar />
            <main className="mx-auto max-w-4xl p-8 text-center">
                <h1 className="text-3xl font-bold mb-4">About</h1>
                <p className="text-lg text-muted-foreground">
                    Players join the game and are automatically separated into teams of 2
                    (or 3 if needed). The only catch is that they don't know their teammate!
                    Teammates are hidden until the end, and the team
                    with the most combined points wins.
                </p>
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