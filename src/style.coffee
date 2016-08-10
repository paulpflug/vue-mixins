# out: ../style.js
arrayize = (arr) ->
  if Array.isArray(arr) then arr else [arr]
module.exports =
  computed:
    computedStyle: ->
      return @style unless @mergeStyle?
      return arrayize(@mergeStyle).concat arrayize(@style)
