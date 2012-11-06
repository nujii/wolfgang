_ = require "underscore"

module.exports =
  assign: (args, allowed)->
    body = {}
    _.each args?.template?.data, (datum)->
      body[datum.name] = datum.value if datum.name in allowed
    body
