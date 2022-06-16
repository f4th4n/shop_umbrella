const path = require('path');

module.exports = {
  entry: './src/vendor.js',
  mode: 'development',
  watch: true,
  output: {
    filename: 'vendor.js',
    path: path.resolve(__dirname, 'dist'),
  },
  watchOptions: {
    poll: true,
    ignored: /node_modules/
  },
  devServer: {
    static: {
      directory: __dirname,
    },
    compress: true,
    port: 9000
  },
};