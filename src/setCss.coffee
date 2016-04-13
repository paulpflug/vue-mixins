# out: ../setCss.js
setCss = (el, name, value) ->
  return unless el? and name?
  style = el.getAttribute("style")
  css = null
  if style?
    splitted = style.split(";")
    css = {}
    for str in splitted
      if str
        [cssname,cssvalue] = str.split(":")
        cssname = cssname.slice(1) if cssname[0] == ' '
        css[cssname] = cssvalue
    if value? and value != ""
      css[name] = value
    else if css[name]?
      delete css[name]
  else if value? and value != ""
    css = {}
    css[name] = value
  cssString = ""
  if css?
    for name,value of css
      cssString += "#{name}:#{value};"
  if cssString
    el.setAttribute("style", cssString)
  else
    el.removeAttribute("style")
module.exports =
  methods:
    setCss: setCss
