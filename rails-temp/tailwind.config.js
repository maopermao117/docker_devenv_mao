// ここでtailwind使ったら変換するhtmlファイルとかを指定してるよ。
module.exports = {
  content: [
    './app/views/**/*.html.erb',
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
  ],
}