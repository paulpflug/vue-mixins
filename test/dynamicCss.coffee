comp = loadComp mixins: [require "../src/dynamicCss.coffee"]
styletag = document.getElementById("vm-dynamic-css")
stylesheet = if styletag.sheet then styletag.sheet else styletag.styleSheet
cssRules = stylesheet.cssRules or stylesheet.rules or []
describe "dynamicCss", ->
  it 'should add a rule', ->
    comp.setCssRules "p":"font-size": "12px"
    cssRules[0].cssText.should.equal "p { font-size: 12px; }"
  it 'should add another property', ->
    comp.setCssRules "p":"height": "12px"
    cssRules[0].cssText.should.equal "p { font-size: 12px; height: 12px; }"
  it 'should remove a property', ->
    comp.setCssRules "p":"height": null
    cssRules[0].cssText.should.equal "p { font-size: 12px; }"
  it 'should remove a rule', ->
    comp.setCssRules "p":null
    should.not.exist(cssRules[0])
  it 'should flatten', ->
    comp.setCssRules "p": {"& p" :{"font-size": "12px"},"height":"12px"}
    cssRules[0].cssText.should.equal "p p { font-size: 12px; }"
    cssRules[1].cssText.should.equal "p { height: 12px; }"
  it 'should remove flattened', ->
    comp.setCssRules "p": "& p": null
    comp.setCssRules "p": null
    should.not.exist(cssRules[0])
    should.not.exist(cssRules[1])
  it 'should flatten deep', ->
    comp.setCssRules "p": {"& p" :{"& p" :{"font-size": "12px"}}}
    cssRules = stylesheet.cssRules or stylesheet.rules or []
    cssRules[0].cssText.should.equal "p p p { font-size: 12px; }"
