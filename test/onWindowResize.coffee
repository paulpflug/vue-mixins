comp = loadComp mixins: [require "../src/onWindowResize.coffee"]
describe "onWindowResize", ->
  it 'should call cb on window resize', (done) ->
    spy = chai.spy()
    comp.onWindowResize spy
    document.dispatchEvent(
      new Event 'resize',
        'view': window
        'bubbles': true
        'cancelable': true
        )
    window.requestAnimationFrame ->
      spy.should.have.been.called.once
      done()
