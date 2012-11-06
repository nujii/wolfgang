{Controller} = require "locomotive"
Publication = require "../models/publication"
util = require "../../lib/util"
module.exports = exports = new Controller()

# #Actions
exports.index = ->
  @res.set "Cache-Control", "max-age=604800, public"
  @render format: "json"

exports.publish = ->
  @redirect @urlFor action: "index"

exports.before "publish", (next)->
  body = util.assign @req.body, ["uri", "action", "etag", "last-modified"]
  Publication.create body, (err)->
    next err
