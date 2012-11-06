module.exports = (error, req, res, next)->

  status = error.status or 500
  console.error error if status >= 500

  errorObj =
    code: status
    title: error.message
    message: error.stack

  locals =
    error: errorObj
    user: req.user
    href: req.fullUrl

  res.render "error", locals, (renderError, result)->
    # Let's hope the error template has no error
    res.send status, result
