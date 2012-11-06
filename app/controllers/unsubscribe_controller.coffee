{Controller} = require "locomotive"
Subscription = require "../models/subscription"
util = require "../../lib/util"
module.exports = exports = new Controller()

# #Actions
exports.index = ->
  this.render format: "json"

exports.unsubscribe = ->
  @redirect @urlFor action: "index"

exports.before "unsubscribe", (next)->
  options =
    uri: @param("uri")
    callback: @param("callback")

  Subscription.find options, (err, subscription)->
    return next err if err

    subscription.destroy (err)->
      next err
