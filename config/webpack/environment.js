const { environment } = require('@rails/webpacker')
const jquery = require('./plugins/jquery')

const webpack = require('webpack')
environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Isotope: 'isotope-layout',
    imagesLoaded: 'imagesloaded',
    Popper: ['popper.js', 'default']
  })
)

environment.plugins.prepend('jquery', jquery)
module.exports = environment
