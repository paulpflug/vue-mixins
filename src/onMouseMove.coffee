# out: ../onMouseMove.js
allMouseMoveCbs = []
callMouseMoveCbs = ->
  for cb in allMouseMoveCbs
    cb.apply(null,arguments)
rAF = window.requestAnimationFrame ||
      window.mozRequestAnimationFrame ||
      window.webkitRequestAnimationFrame ||
      window.msRequestAnimationFrame

cAF = window.cancelAnimationFrame ||
      window.mozCancelAnimationFrame

if rAF?
  lastRequest = null
  window.addEventListener "mousemove", ->
    args = arguments
    cAF(lastRequest)
    lastRequest = rAF -> callMouseMoveCbs.apply(null,args)
else
  throttle = require("lodash/throttle")
  window.addEventListener "mousemove", throttle(callMouseMoveCbs,66)


module.exports =
  data: ->
    mouseMoveCbDisposables: []
  methods:
    onMouseMove: (cb) ->
      allMouseMoveCbs.push cb
      dispose = ->
        index = allMouseMoveCbs.indexOf cb
        if index > -1
          allMouseMoveCbs.splice index,1
      @mouseMoveCbDisposables.push dispose
      return =>
        dispose()
        index = @mouseMoveCbDisposables.indexOf dispose
        if index > -1
          @mouseMoveCbDisposables.splice index,1

  beforeDestroy: ->
    for mouseMoveCbDisposable in @mouseMoveCbDisposables
      mouseMoveCbDisposable()
