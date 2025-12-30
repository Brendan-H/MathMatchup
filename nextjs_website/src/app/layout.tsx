import localFont from "next/font/local";
import "../styles/globals.css";

const geistSans = localFont({
  src: "./fonts/GeistVF.woff",
  variable: "--font-geist-sans",
  weight: "100 900",
});
const geistMono = localFont({
  src: "./fonts/GeistMonoVF.woff",
  variable: "--font-geist-mono",
  weight: "100 900",
});

export const metadata = {
  title: "MathMatchup",
  description: "The math quiz game with mystery teammates!",
};

export default function RootLayout({
                                     children
}: {
  children: React.ReactNode;
}) {
  return (
      <html lang="en">
      <body className="min-h-screen bg-background text-foreground">
      {children}
      </body>
      </html>
  );
}
