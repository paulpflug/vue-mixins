comp = loadComp mixins: [require "../src/onClick.coffee"]
describe "onClick", ->
  it 'should be called on click', ->
    spy = chai.spy()
    comp.onClick = spy
    comp.click()
    spy.should.have.been.called.once
