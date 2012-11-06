{Controller} = require "locomotive"
Subscription = require "../models/subscription"
util = require "../../lib/util"
module.exports = exports = new Controller()

# #Actions
exports.index = ->
  @res.set "Cache-Control", "max-age=604800, public"
  this.render format: "json"

exports.subscribe = ->
  @redirect @urlFor action: "index"

exports.before "subscribe", (next)->
  body = util.assign @req.body, ["uri", "callback"]
  Subscription.create body, (err)->
    next err
