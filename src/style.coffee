# out: ../style.js
isString = (str) -> typeof str == 'string' or str instanceof String
trim = (str) -> return str.replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, '')
arrayize = (arr) ->
  if Array.isArray(arr)
    return arr
  else if isString(arr)
    obj = {}
    for opt in arr.split(";")
      kv = opt.split(":")
      obj[trim(kv[0])] = trim(kv[1])
    return [obj]
  else
    return [arr]
module.exports =
  computed:
    computedStyle: ->
      style = arrayize(@style)
      return style unless @mergeStyle?
      return arrayize(@mergeStyle).concat style
