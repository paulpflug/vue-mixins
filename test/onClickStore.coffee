comp = loadComp mixins: [require "../src/onClickStore.coffee"]
describe "onClickStore", ->
  disposes = []
  spies = [chai.spy(),chai.spy(),chai.spy()]
  it 'should call all cbs on click', ->
    for spy in spies
      disposes.push comp.onClick spy
    comp.click()
    spies[0].should.have.been.called.once
    spies[1].should.have.been.called.once
    spies[2].should.have.been.called.once
  it 'should properly dispose', ->
    disposes[2]()
    comp.click()
    spies[0].should.have.been.called.twice
    spies[1].should.have.been.called.twice
    spies[2].should.have.been.called.once
    disposes[1]()
    comp.click()
    spies[0].should.have.been.called.exactly(3)
    spies[1].should.have.been.called.twice
    spies[2].should.have.been.called.once
