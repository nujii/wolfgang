resourceful = require "resourceful"

module.exports = resourceful.define "notification", ->
  @string "uri"
  @string "action"
  @string "etag"
  @string "last-modified"
  @timestamps()
