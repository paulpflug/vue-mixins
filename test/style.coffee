comp =
  el: -> document.createElement "div"
  template: "<div></div>"
  mixins: [require "../src/style.coffee"]
  data: ->
    mergeStyle: []
  props:
    style:
      default: -> []

comp = Vue.extend(comp)
comp = new comp()

describe "style", ->
  it 'should have style', ->
    should.exist comp.style
    comp.style.length.should.equal 0
  it 'should have mergeStyle', ->
    should.exist comp.mergeStyle
    comp.mergeStyle.length.should.equal 0
  it 'should have computedStyle', ->
    should.exist comp.computedStyle
    comp.computedStyle.length.should.equal 0
  it 'should merge arrays', ->
    comp.style = ["a"]
    comp.mergeStyle = ["b"]
    comp.computedStyle[0].should.equal "b"
    comp.computedStyle[1].should.equal "a"
  it "should convert to array, when one isn't a array", ->
    comp.style = a:true
    comp.mergeStyle = ["b"]
    comp.computedStyle.length.should.equal 2
    comp.computedStyle[0].should.equal "b"
    comp.computedStyle[1].a.should.be.true
    comp.style = ["c"]
    comp.mergeStyle = d:true
    comp.computedStyle.length.should.equal 2
    comp.computedStyle[0].d.should.be.true
    comp.computedStyle[1].should.equal "c"
  it "should support plain style strings", ->
    comp.style = "color:red"
    comp.mergeStyle = "color:blue;font-size:10px"
    comp.computedStyle.length.should.equal 2
    comp.computedStyle[0].color.should.equal "blue"
    comp.computedStyle[0]["font-size"].should.equal "10px"
    comp.computedStyle[1].color.should.equal "red"
