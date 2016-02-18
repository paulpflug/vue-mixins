comp = loadComp mixins: [require "../src/getViewportSize.coffee"]
describe "getViewportSize", ->
  it 'should return a object with width and height', ->
    obj = comp.getViewportSize()
    should.exist(obj.width)
    should.exist(obj.height)
