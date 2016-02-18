comp = loadComp mixins: [require "../src/onDocument.coffee"]
describe "onDocument", ->
  dispose = null
  it 'should call cb on event', ->
    spy = chai.spy()
    dispose = comp.onDocument "click", spy
    document.documentElement.dispatchEvent(new Event("click"))
    spy.should.have.been.called.once
  it 'should properly dispose cb', ->
    spy = chai.spy()
    dispose()
    document.documentElement.dispatchEvent(new Event("click"))
    spy.should.not.have.been.called
