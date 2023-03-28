/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        "light-green": #b6d7a8,
        "light-blue": #a4c2f4,
        "light-yellow": #ffe599,
        "light-red": #ea9999,
        "light-purple": #b4a7d6,
        "light-pink": #d5a6bd,
      }
    },
    fontFamily: {
      Roboto: ["Roboto"],
    },
    container: {
      center: true,
  },
  variants: {
    extend: {},
  },
  plugins: [],
},
}
