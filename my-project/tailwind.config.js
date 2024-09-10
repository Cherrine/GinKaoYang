/** @type {import('tailwindcss').Config} */
// tailwind.config.js
module.exports = {
  content: [
    "./src/**/*.{html,ts}",
  ],
  theme: {
    extend: {},
  },
  plugins: [require("daisyui")],
  daisyui: {
    themes: [
      'light', // Set the default theme to light
      // Add other themes if needed
    ],
    styled: true,
    base: true,
    utils: true,
    logs: true,
    rtl: false,
  },
}
