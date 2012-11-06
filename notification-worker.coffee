kue = require "kue"
request = require "request"
require "./config/initializers/00_generic"

notification = kue.createQueue()

notification.process "notification", 20, (job, done)->
  request.post {uri:job.data.callback}, (err, response, body)->
    if err
      job.log "Body:\n#{body}"
      return done err
    done()
