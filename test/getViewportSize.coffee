Vue = require "vue"
app = new Vue
  el: "body"
  mixins: [require "../src/getViewportSize.coffee"]
describe "getViewportSize", ->
  it 'should return a object with width and height', ->
    obj = app.getViewportSize()
    should.exist(obj.width)
    should.exist(obj.height)
