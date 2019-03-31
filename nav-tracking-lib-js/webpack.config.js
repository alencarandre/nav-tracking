module.exports = {
  entry: "./src/index.js",
  output: {
    filename: "./nav-tracking.js"
  },
  devServer: {
    contentBase: './dist',
    compress: true,
    port: 9000
  }
}
