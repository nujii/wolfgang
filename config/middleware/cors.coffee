module.exports = (req, res, next)->
  
  res.header "Access-Control-Allow-Origin", "*"
  # Allow any headers
  reqHeaders = req.get("Access-Control-Request-Headers") or ""
  res.header "Access-Control-Allow-Headers", reqHeaders
  if req.method is 'OPTIONS' then res.send(200) else next()
