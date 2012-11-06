locomotive = require "locomotive"

path = "."
env = process.env.NODE_ENV or "production"
options = {"coffeeScript": true}
port = process.env.PORT or 3000

done = (err, server) ->
  throw err if (err)

  server.listen port, "0.0.0.0", ()->
    addr = this.address()
    console.log("listening on %s:%d", addr.address, addr.port)

module.exports = (fn=done)->
  locomotive.boot path, env, options, fn

module.exports() if process.env.AUTOSTART