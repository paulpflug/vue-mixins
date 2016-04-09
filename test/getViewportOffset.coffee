comp = loadComp {
  template: "<div></div>"
  mixins: [require "../src/getViewportOffset.coffee"]
}
describe "getViewportOffset", ->
  it 'should return a object with top and left', ->
    obj = comp.getViewportOffset()
    should.exist(obj.top)
    should.exist(obj.left)
