module.exports = {
  entry: "./src/index.js",
  output: {
    filename: "./nav-traking.js"
  },
  devServer: {
    contentBase: './dist',
    compress: true,
    port: 9000
  }
}
