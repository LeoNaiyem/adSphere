import forms from '@tailwindcss/forms';
import defaultTheme from 'tailwindcss/defaultTheme';

/** @type {import('tailwindcss').Config} */
export default {
    content: [
        "./vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php",
        "./storage/framework/views/*.php",
        "./resources/views/**/*.blade.php",
        "./resources/js/**/*.vue",
    ],

    theme: {
        extend: {
            fontFamily: {
                sans: ["Figtree", ...defaultTheme.fontFamily.sans],
            },
            colors: {
                primary: {
                    50: "#E6F7F7",
                    100: "#BFEAEA",
                    200: "#99DCDC",
                    300: "#66C7C6",
                    400: "#33B2B0",
                    500: "#019F9A",
                    600: "#017B77",
                    700: "#015D5A",
                    800: "#014440",
                    900: "#013B3A",
                },
            },
        },
    },

    plugins: [forms],
};
