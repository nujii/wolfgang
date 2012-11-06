kue = require "kue"
async = require "async"
require "./config/initializers/00_generic"
Subscription = require "./app/models/subscription"

jobs = kue.createQueue()

jobs.process "publication", 20, (job, done)->
  publication = job.data
  Subscription.find uri: publication.uri, (error, subscriptions)->
    return done error if error

    length = subscriptions?.length or 0
    job.log "#{length} subscriptions for #{publication.uri}"
    count = 0

    async.forEach subscriptions, ((subscription, next)->
      newJob =
        title: "#{subscription.uri} -> #{subscription.callback}"
        id: subscription.id
        uri: subscription.uri
        callback: subscription.callback
      jobs.create("notification", newJob).save()
      count++
      job.progress(count, length)
      next()
    ), (err)->
      done err
