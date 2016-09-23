webpack = require('webpack')

module.exports = {
  entry: "./build/index.js"
  output:
    filename: "./build/bundle.js"
  plugins: [
    new webpack.optimize.UglifyJsPlugin compress: warnings: false
  ]
}
