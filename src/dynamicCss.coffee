# out: ../dynamicCss.js
if document?
  styletag = document.createElement('style')
  styletag.setAttribute 'id', 'vm-dynamic-css'
  styletag.setAttribute "type","text/css"
  document.head.appendChild styletag
  stylesheet = if styletag.sheet then styletag.sheet else styletag.styleSheet

flatten = (obj,base="") ->
  tmp = {}
  for key,val of obj
    if val instanceof Object
      props = {}
      for key2,val2 of val
        if key2.indexOf("&") > -1
          tmp2 = {}
          tmp2[key2.replace("&","")] = val2
          tmp2 = flatten(tmp2,base+key)
          for key3, val3 of tmp2
            tmp[key3] = val3
        else
          props[key2] = val2
      tmp[base+key] = props
    else
      tmp[base+key] = val
  return tmp

setRules = (newRules) ->
  newRules = flatten(newRules)
  for selector,css of newRules
    str = ""
    {cssRule,index} = getRule(selector)
    if cssRule?
      if css?
        for singleRule,singleValue of css
          if singleValue?
            cssRule.style.setProperty singleRule, singleValue
          else
            cssRule.style.removeProperty singleRule
      else
        removeRule(index)
    else
      if css?
        for singleRule,singleValue of css
          if singleValue?
            str += singleRule+":"+singleValue+";"
        insertRule(selector,str)

getRule = (selector) ->
  cssRules = stylesheet.cssRules or stylesheet.rules or []
  for cssRule,index in cssRules
    if cssRule.selectorText == selector
      return {cssRule:cssRule,index:index}
  return {cssRule:null,index:null}

insertRule = (selector,str) ->
  selector = selector.toLowerCase()
  str = str.toLowerCase()
  if stylesheet.insertRule
    stylesheet.insertRule selector + ' { ' + str + ' } ', stylesheet.cssRules.length
  else if stylesheet.addRule
    stylesheet.addRule selector, str

removeRule = (index) ->
  if stylesheet.removeRule
    stylesheet.removeRule(index)
  else
    stylesheet.deleteRule(index)

module.exports =
  methods:
    'setCssRules': setRules
