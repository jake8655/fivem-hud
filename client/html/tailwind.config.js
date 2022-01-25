module.exports = {
  content: ['./index.html'],
  theme: {
    extend: {
      colors: {
        c_health: '#17cf4e',
        c_armor: '#1919e6',
        c_hunger: '#fe8a00',
        c_thirst: '#19a2e6',
      },
      spacing: {
        c_m: 'clamp(40px, 2.5vh, 50px)',
      },
      fontFamily: {
        poppins: ['Poppins'],
      },
      fontSize: {
        c_s: '.8rem',
      },
    },
  },
  plugins: [],
};
