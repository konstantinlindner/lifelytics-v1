/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./index.html", "./src/**/*.{vue,js,ts,jsx,tsx}"],
  theme: {
    extend: {
      colors: {
        "dark-light-green": "#8abf74",
        "light-green": "#b6d7a8",
        "light-light-green": "#d3e7cb",
        "light-blue": "#a4c2f4",
        "light-yellow": "#ffe599",
        "light-red": "#ea9999",
        "light-purple": "#b4a7d6",
        "light-pink": "#d5a6bd",
        "light-grey": "#ededed",
      },
    },
    fontFamily: {
      Roboto: ["Roboto, sans-serif"],
    },
    container: {
      center: true,
    },
    variants: {
      extend: {},
    },
    plugins: [],
  },
};
