comp =
  el: -> document.createElement "div"
  template: "<div></div>"
  mixins: [require "../src/class.coffee"]
  data: ->
    mergeClass: []
  props:
    class:
      default: -> []

comp = Vue.extend(comp)
comp = new comp()

describe "class", ->
  it 'should have class', ->
    should.exist comp.class
    comp.class.length.should.equal 0
  it 'should have mergeClass', ->
    should.exist comp.mergeClass
    comp.mergeClass.length.should.equal 0
  it 'should have computedClass', ->
    should.exist comp.computedClass
    comp.computedClass.length.should.equal 0
  it 'should merge arrays', ->
    comp.class = ["a"]
    comp.mergeClass = ["b"]
    comp.computedClass[0].should.equal "b"
    comp.computedClass[1].should.equal "a"
  it "should convert to object, when one isn't a array", ->
    comp.class = a:true
    comp.mergeClass = ["b"]
    comp.computedClass.a.should.be.true
    comp.computedClass.b.should.be.true
    comp.class = ["c"]
    comp.mergeClass = d:true
    comp.computedClass.c.should.be.true
    comp.computedClass.d.should.be.true
    should.not.exist comp.computedClass.a
    should.not.exist comp.computedClass.b
  it "should merge objects", ->
    comp.class = a:true,b:true
    comp.mergeClass = b:false,c:true
    comp.computedClass.a.should.be.true
    comp.computedClass.b.should.be.true
    comp.computedClass.c.should.be.true
  it "should support objects in arrays", ->
    comp.class = ["a", b:false]
    comp.mergeClass = b:true,c:true
    comp.computedClass.a.should.be.true
    comp.computedClass.b.should.be.false
    comp.computedClass.c.should.be.true
  it "should support plain class strings", ->
    comp.class = "a b"
    comp.mergeClass = "c d e"
    comp.computedClass.length.should.equal 5
    comp.computedClass[0].should.equal "c"
    comp.computedClass[1].should.equal "d"
    comp.computedClass[2].should.equal "e"
    comp.computedClass[3].should.equal "a"
    comp.computedClass[4].should.equal "b"
