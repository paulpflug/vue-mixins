Vue = require "vue"
app = new Vue
  el: "body"
  mixins: [require "../src/onElementResize.coffee"]
describe "onElementResize", ->
  it 'should call cb on window resize'
  it "should call cb on element width change", (done) ->
    spy = chai.spy()
    app.onElementResize document.body, spy
    document.body.setAttribute("style", "width:200px")
    setTimeout (->
      spy.should.have.been.called.once
      document.body.removeAttribute("style")
      setTimeout (->
        spy.should.have.been.called.twice
        done()
        ),100
      ),100
  it "should call cb on element height change", (done) ->
    spy = chai.spy()
    app.onElementResize document.body, spy
    document.body.setAttribute("style", "height:200px")
    setTimeout (->
      spy.should.have.been.called.once
      document.body.removeAttribute("style")
      setTimeout (->
        spy.should.have.been.called.twice
        done()
        ),100
      ),100
  it "should call cb on element when an larger inner element is added", (done) ->
    spy = chai.spy()
    app.onElementResize document.body, spy
    el = document.createElement "div"
    el.setAttribute "style", "height:200px"
    document.body.appendChild el
    setTimeout (->
      spy.should.have.been.called.once
      document.body.removeChild el
      setTimeout (->
        spy.should.have.been.called.twice
        done()
        ),100
      ),100
