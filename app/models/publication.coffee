resourceful = require "resourceful"
kue = require "kue"
publications = kue.createQueue()

module.exports = resourceful.define "publication", ->
  @string "uri"
  @string "action"
  @string "etag"
  @string "last-modified"
  @timestamps()

module.exports.on "save", (publication)->
  job =
    title: publication.uri
    uri: publication.uri
  publications.create("publication", job).save();
