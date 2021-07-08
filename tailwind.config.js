const plugin = require("tailwindcss/plugin")

module.exports = {
  purge: [],
  theme: {
    extend: {
      colors: {
        "bf-green": "#a1d043",
        "bf-pink": "#ef73a5",
      },
      fontFamily: {
        body: ["LacrimaSenza", "monospace"],
        heading: ["OmnesPro", "sans-serif"],
      },
      fontSize: {
        "7xl": "5rem",
        "8xl": "6rem",
        "9xl": "7rem",
        "10xl": "8rem",
      },
    },
  },
  variants: {},
  plugins: [
    plugin(function({ addUtilities }) {
      addUtilities({
        ".wavy": { "text-decoration": "underline wavy" },
      })
    })
  ],
}
