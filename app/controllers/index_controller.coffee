{Controller} = require "locomotive"

module.exports = exports = new Controller()

# #Actions
exports.index = ->
  this.render format: "json"
