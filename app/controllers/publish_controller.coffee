{Controller} = require "locomotive"
Notification = require "../models/notification"
util = require "../../lib/util"
module.exports = exports = new Controller()

# #Actions
exports.index = ->
  @render format: "json"

exports.publish = ->
  @redirect @urlFor action: "index"

exports.before "publish", (next)->
  body = util.assign @req.body, ["uri", "action", "etag", "last-modified"]
  Notification.create body, (err)->
    next err
