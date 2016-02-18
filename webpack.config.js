var webpack = require('webpack')

module.exports = {
    entry: "./index.js",
    output: {
        filename: "bundle.js"
    },
    plugins: [
      new webpack.optimize.UglifyJsPlugin({compress: {warnings: false}}),
      new webpack.optimize.OccurenceOrderPlugin()
    ]
}
