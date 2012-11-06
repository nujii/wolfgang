{Controller} = require "locomotive"

module.exports = exports = new Controller()

# #Actions
exports.index = ->
  @res.set "Cache-Control", "max-age=604800, public"
  this.render format: "json"
