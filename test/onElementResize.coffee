comp = loadComp mixins: [require "../src/onElementResize.coffee"]
cel = comp.$el
describe "onElementResize", ->
  it "should not call cb on window resize "+
     " when element doesn't change", (done) ->
    spy = chai.spy()
    comp.onElementResize cel, spy
    document.dispatchEvent(
      new Event 'resize',
        'view': window
        'bubbles': true
        'cancelable': true
        )
    window.requestAnimationFrame ->
      spy.should.not.have.been.called()
      done()

  it "should call cb on element width change", (done) ->
    spy = chai.spy()
    comp.onElementResize cel, spy
    cel.setAttribute("style", "width:200px")
    setTimeout (->
      spy.should.have.been.called.once
      cel.removeAttribute("style")
      setTimeout (->
        spy.should.have.been.called.twice
        done()
        ),100
      ),100
  it "should call cb on element height change", (done) ->
    spy = chai.spy()
    comp.onElementResize cel, spy
    cel.setAttribute("style", "height:200px")
    setTimeout (->
      spy.should.have.been.called.once
      cel.removeAttribute("style")
      setTimeout (->
        spy.should.have.been.called.twice
        done()
        ),100
      ),100
  it "should call cb on element when an "+
     "larger inner element is added", (done) ->
    spy = chai.spy()
    comp.onElementResize cel, spy
    el = document.createElement "div"
    el.setAttribute "style", "height:200px"
    cel.appendChild el
    setTimeout (->
      spy.should.have.been.called.once
      cel.removeChild el
      setTimeout (->
        spy.should.have.been.called.twice
        done()
        ),100
      ),100
