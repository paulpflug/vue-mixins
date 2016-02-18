comp = loadComp mixins: [require "../src/setCss.coffee"]
describe "setCss", ->
  it 'should add a style prop', ->
    comp.setCss document.body, "width", "100%"
    document.body.should.have.attr("style","width:100%;")
  it 'should add another style prop', ->
    comp.setCss document.body, "height", "100%"
    document.body.should.have.attr("style","width:100%;height:100%;")
  it 'should remove a style prop', ->
    comp.setCss document.body, "width"
    document.body.should.have.attr("style","height:100%;")
  it 'should remove another style prop', ->
    comp.setCss document.body, "height"
    document.body.should.not.have.attr("style")
