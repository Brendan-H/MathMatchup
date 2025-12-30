import Header from "@/components/Header";
import Navbar from "@/components/Navbar";

export default function PricingPage() {
    return (
        <>
            <Header />
            <Navbar />
            <main className="mx-auto max-w-6xl p-8 text-foreground">
                <h1 className="text-4xl font-bold mb-2">Pricing</h1>
                <p className="text-muted-foreground mb-8">
                    Choose the plan that's right for you
                </p>

                <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <div className="rounded-xl border p-6">
                        <h2 className="text-xl font-semibold mb-2">Student</h2>
                        <p className="font-bold mb-4">Free</p>
                        <ul className="text-sm space-y-1">
                            <li>Unlimited questions</li>
                            <li>No ads</li>
                            <li className="text-red-500">Cannot start games</li>
                        </ul>
                    </div>
                </div>
            </main>
        </>
    );
}



//old pricing page code (before shadcn and new router)
// import Head from "next/head";
// import Header from "@/components/Header";
// import Navbar from "@/components/Navbar";
// import {useRouter} from "next/router";
// import {Url} from "next/dist/shared/lib/router/router";
//
//
// export default function Pricing() {
//     const router = useRouter();
//
//     const handleNavigation = (path: Url) => {
//         router.push(path);
//     };
//
//     return (
//         <div>
//             <Head>
//                 <title>Welcome To MathMatchup</title>
//             </Head>
//             <Header />
//             <Navbar />
//             <h1>Pricing</h1>
//             <p>Choose the plan that's right for you</p>
//             <div style={styles.container}>
//                 <div>
//                     <h2>Student Pricing</h2>
//                     <p>100% FREE!!!</p>
//                     <ul>
//                         <li>Play games in class or at home</li>
//                         <li>Unlimited questions</li>
//                         <li>No Ads</li>
//                         <li>No Ads</li>
//                         <li style={{color: 'red'}}>Cannot start games</li>
//                     </ul>
//                 </div>
//                 <div>
//                     <h2>Parent Pricing</h2>
//                     <p>$1.99/month/child</p>
//                     <ul>
//                         <li>Start games</li>
//                         <li>Unlimited questions</li>
//                         <li>No ads</li>
//                         <li>View child's progress</li>
//                         <li style={{fontWeight: 'bold'}}>Sign up in app</li>
//                     </ul>
//                 </div>
//                 <div>
//                     <h2>Education Pricing</h2>
//                     <ul>
//                         <li>Start games for your class</li>
//                         <li>Unlimited questions</li>
//                         <li>No ads</li>
//                         <li>View student progress</li>
//                         <li>Customize questions</li>
//                         <li>Advanced game stats</li>
//                     </ul>
//                     <button style={styles.button} onClick={() => handleNavigation('/education/pricing')}>Sign Up</button>
//                 </div>
//             </div>
//         </div>
//     );
// }
//
// const styles = {
//     container: {
//         display: 'flex',
//         justifyContent: 'center',
//         alignItems: 'center',
//         gap: '20px',
//     },
//     card: {
//         padding: '20px',
//         border: '1px solid #ccc',
//         borderRadius: '5px',
//         width: '200px',
//         textAlign: 'center',
//     },
//     button: {
//         padding: '10px',
//         backgroundColor: '#0070f3',
//         color: 'white',
//         border: 'none',
//         borderRadius: '5px',
//         cursor: 'pointer',
//     },
// }