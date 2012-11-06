module.exports = (req, res, next)->
  errorObj =
    code: 404
    title: "Not found"

  locals =
    error: errorObj
    user: req.user
    href: req.fullUrl

  res.render "error", locals, (renderError, result)->
    console.error renderError if renderError
    # Let's hope the error template has no error
    res.send 404, result
    res.end()
