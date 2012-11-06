
# TODO figure out urlFor outside of locomotive
globalLinks = [
  rel: "index", href: "/", prompt: "Index"
,
  rel: "publish", href: "/publish", prompt: "Publish"
,
  rel: "subscribe", href: "/subscribe", prompt: "Subscribe"
,
  rel: "unsubscribe", href: "/unsubscribe", prompt: "Unsubscribe"
]

module.exports = (req, res, next)->
  protocol = req.protocol or "http"
  host = req.get "host"

  res.locals.globalLinks = []
  for link in globalLinks
    res.locals.globalLinks.push
      rel: link.rel
      href: "#{protocol}://#{host}#{link.href}"
      prompt: link.prompt
  next()
