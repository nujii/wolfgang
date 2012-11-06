express = require "express"
passport = require "passport"
module.exports = ->
  
  @disable "x-powered-by"

  @set "views", "#{__dirname}/../../app/views"
  @set "view engine", "cscj"
  
  # Register CSCJ as a template engine.
  @engine "cscj", require("cscj").__express
  
  this.format "json", engine: "cscj"

  isDev = @get("env") is "development"

  @use express.timeout()
  @use require "../middleware/cors"
  @use require "../middleware/fullUrl"
  @use express.compress()
  @use express.favicon()
  @use express.logger(if isDev then "dev")
  @use express.responseTime()
  @use express.bodyParser()
  @use express.methodOverride()
  @use passport.initialize()
  @use require "../middleware/experiment"
  @use require "../middleware/links"
  @use @router
  @use require "../middleware/404"
  @use require "../middleware/error"
