comp = loadComp mixins: [require "../src/vue.coffee"]
describe "vue", ->
  it 'should get Vue', ->
    name = comp.Vue.toString()
    name = name.substr('function '.length);
    name = name.substr(0, name.indexOf('('));
    name.should.equal "Vue"
