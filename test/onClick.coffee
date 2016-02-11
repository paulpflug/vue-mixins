Vue = require "vue"
app = new Vue
  el: "body"
  mixins: [require "../src/onClick.coffee"]
describe "onClick", ->
  it 'should be called on click', ->
    spy = chai.spy()
    app.onClick = spy
    app.click()
    spy.should.have.been.called.once
