comp = loadComp mixins: [require "../src/fragToString.coffee"]
describe "fragToString", ->
  it "should resolve a frag to string", ->
    frag = document.createDocumentFragment()
    p = document.createElement('p')
    p.textContent = 'test'
    frag.appendChild p
    comp.fragToString(frag).should.equal("<p>test</p>")
