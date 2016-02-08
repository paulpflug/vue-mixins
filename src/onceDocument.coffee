# out: ../onceDocument.js
onceDocument = (event, cb, useCapture) ->
  remover = null
  wrapper = (e) ->
    if cb(e)
      remover() if remover?
  document.documentElement.addEventListener event, wrapper, useCapture
  remover = ->
    document.documentElement.removeEventListener event, wrapper
    remover = null
  return remover
module.exports =
  methods:
    onceDocument: onceDocument
