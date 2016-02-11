Vue = require "vue"
app = new Vue
  el: "body"
  mixins: [require "../src/onClickStore.coffee"]
describe "onClickStore", ->
  disposes = []
  spies = [chai.spy(),chai.spy(),chai.spy()]
  it 'should call all cbs on click', ->
    for spy in spies
      disposes.push app.onClick spy
    app.click()
    spies[0].should.have.been.called.once
    spies[1].should.have.been.called.once
    spies[2].should.have.been.called.once
  it 'should properly dispose', ->
    disposes[2]()
    app.click()
    spies[0].should.have.been.called.twice
    spies[1].should.have.been.called.twice
    spies[2].should.have.been.called.once
    disposes[1]()
    app.click()
    spies[0].should.have.been.called.exactly(3)
    spies[1].should.have.been.called.twice
    spies[2].should.have.been.called.once
