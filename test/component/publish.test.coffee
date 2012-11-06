request = require "supertest"
should = require "should"
process.env.NODE_ENV = "development"
app = null

pathReg = /.+?\:\/\/.+?(\/.+?)(?:#|\?|$)/

describe "Publish", ->

  before (done)->
    require("../../server") (err, _app)->
      throw err if err
      app = _app
      done()

  describe "GET /publish", ->
    it "should return the correct content-type", (done)->
      request(app)
        .get('/publish')
        .set('Accept', 'application/json')
        .expect('Content-Type', /json/)
        .expect(200, done)

