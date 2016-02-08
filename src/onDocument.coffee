# out: ../onDocument.js
onDocument = (event, cb, useCapture) ->
  document.documentElement.addEventListener event, cb, useCapture
  remover = ->
    document.documentElement.removeEventListener event, cb
    remover = null
  return remover
module.exports =
  methods:
    onDocument: onDocument
