comp = loadComp mixins: [require "../src/onClickStack.coffee"]
describe "onClickStack", ->
  disposes = []
  spies = [chai.spy(),chai.spy(),chai.spy()]
  it 'should call last cb on click', ->
    for spy in spies
      disposes.push comp.addToClickStack spy
    comp.click()
    spies[0].should.not.have.been.called
    spies[1].should.not.have.been.called
    spies[2].should.have.been.called.once
  it 'should properly dispose', ->
    disposes[2]()
    comp.click()
    spies[0].should.not.have.been.called
    spies[1].should.have.been.called.once
    disposes[1]()
    comp.click()
    spies[0].should.have.been.called.once
