Vue = require "vue"
app = new Vue
  el: "body"
  mixins: [require "../src/onWindowResize.coffee"]
describe "onWindowResize", ->
  it 'should call cb on window resize'#, (done) ->
    # spy = chai.spy()
    # app.onWindowResize spy
    # ev = document.createEvent('Event')
    # ev.initEvent('resize', true, true)
    # window.dispatchEvent(ev)
    # console.log window.requestAnimationFrame
    # window.requestAnimationFrame ->
    #   spy.should.have.been.called.once
    #   done()
