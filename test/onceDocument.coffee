comp = loadComp mixins: [require "../src/onceDocument.coffee"]
describe "onceDocument", ->
  dispose = null
  it 'should call cb on event and remove on success', ->
    spy = chai.spy()
    comp.onceDocument "click", -> spy(); return true
    document.documentElement.dispatchEvent(new Event("click"))
    spy.should.have.been.called.once
    document.documentElement.dispatchEvent(new Event("click"))
    spy.should.have.been.called.once
  it 'should call cb on event and not remove on failure', ->
    spy = chai.spy()
    dispose = comp.onceDocument "click", -> spy(); return false
    document.documentElement.dispatchEvent(new Event("click"))
    spy.should.have.been.called.once
    document.documentElement.dispatchEvent(new Event("click"))
    spy.should.have.been.called.twice
  it 'should properly dispose cb', ->
    spy = chai.spy()
    dispose()
    document.documentElement.dispatchEvent(new Event("click"))
    spy.should.not.have.been.called
