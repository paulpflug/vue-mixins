# out: ../onWindowScroll.js
allScrollCbs = []
callScrollCbs = ->
  for cb in allScrollCbs
    cb.apply(null,arguments)
rAF = window.requestAnimationFrame ||
      window.mozRequestAnimationFrame ||
      window.webkitRequestAnimationFrame ||
      window.msRequestAnimationFrame

cAF = window.cancelAnimationFrame ||
      window.mozCancelAnimationFrame
if rAF
  lastRequest = null
  window.addEventListener "scroll", ->
    args = arguments
    cAF(lastRequest)
    lastRequest = rAF -> callScrollCbs.apply(null,args)
else
  throttle = require("lodash/throttle")
  window.addEventListener "scroll", throttle(callScrollCbs,66)


module.exports =
  data: ->
    scrollCbDisposables: []
  methods:
    onWindowScroll: (cb) ->
      allScrollCbs.push cb
      dispose = ->
        index = allScrollCbs.indexOf cb
        if index > -1
          allScrollCbs.splice index,1
      @scrollCbDisposables.push dispose
      return =>
        dispose()
        index = @scrollCbDisposables.indexOf dispose
        if index > -1
          @scrollCbDisposables.splice index,1

  beforeDestroy: ->
    for scrollCbDisposable in @scrollCbDisposables
      scrollCbDisposable()
