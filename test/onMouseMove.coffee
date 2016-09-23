comp = loadComp mixins: [require "../src/onMouseMove.coffee"]
describe "onMouseMove", ->
  it 'should call cb on mouse move', (done) ->
    spy = chai.spy()
    comp.onMouseMove spy
    document.dispatchEvent(
      new Event 'mousemove',
        'view': window
        'bubbles': true
        'cancelable': true
        )
    window.requestAnimationFrame ->
      spy.should.have.been.called.once
      done()
