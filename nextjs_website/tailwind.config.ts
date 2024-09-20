import type { Config } from "tailwindcss";
import { colors } from "@/styles/colors";

const config: Config = {
  content: [
    "./src/pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/components/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    fontFamily: {
      display: ["Poppins", "sans-serif"],
    },
    extend: {
      colors: {
        background: colors.appBarColor,
        foreground: "var(--foreground)",
      },
    },
  },
  plugins: [],
};
export default config;