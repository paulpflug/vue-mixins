comp = loadComp mixins: [require "../src/getVue.coffee"]
describe "getVue", ->
  it 'should get Vue', ->
    name = comp.getVue().toString()
    name = name.substr('function '.length);
    name = name.substr(0, name.indexOf('('));
    name.should.equal "Vue"
