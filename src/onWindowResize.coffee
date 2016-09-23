# out: ../onWindowResize.js
allResizeCbs = []
callResizeCbs = ->
  for cb in allResizeCbs
    cb.apply(null,arguments)
  resizeRunning = false
rAF = window.requestAnimationFrame ||
      window.mozRequestAnimationFrame ||
      window.webkitRequestAnimationFrame ||
      window.msRequestAnimationFrame

cAF = window.cancelAnimationFrame ||
      window.mozCancelAnimationFrame
if rAF
  lastRequest = null
  window.addEventListener "resize", ->
    args = arguments
    cAF(lastRequest)
    lastRequest = rAF -> callResizeCbs.apply(null,args)
else
  throttle = require("lodash/throttle")
  window.addEventListener "resize", throttle(callResizeCbs,66)

module.exports =
  data: ->
    resizeCbDisposables: []
  methods:
    onWindowResize: (cb) ->
      allResizeCbs.push cb
      dispose = ->
        index = allResizeCbs.indexOf cb
        if index > -1
          allResizeCbs.splice index,1
      @resizeCbDisposables.push dispose
      return =>
        dispose()
        index = @resizeCbDisposables.indexOf dispose
        if index > -1
          @resizeCbDisposables.splice index,1

  beforeDestroy: ->
    for resizeCbDisposable in @resizeCbDisposables
      resizeCbDisposable()
