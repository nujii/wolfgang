resourceful = require "resourceful"

module.exports = resourceful.define "subscription", ->
  @string "uri"
  @string "callback"
  @timestamps()
