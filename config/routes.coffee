
module.exports = ->

  # /
  @root "index#index"

  # /publish
  @match "/publish", "publish#index", via: "get"
  @match "/publish", "publish#publish", via: "post"

  # /subscribe
  @match "/subscribe", "subscribe#index", via: "get"
  @match "/subscribe", "subscribe#subscribe", via: "post"

  # /unsubscribe
  @match "/unsubscribe", "unsubscribe#index", via: "get"
  @match "/unsubscribe", "unsubscribe#unsubscribe", via: "post"
