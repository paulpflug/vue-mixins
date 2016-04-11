# out: ../onWindowScroll.js
scrollRunning = false
allScrollCbs = []
scrollHandler = ->
  unless scrollRunning
    args = arguments
    scrollRunning = true
    if window.requestAnimationFrame
      window.requestAnimationFrame -> callScrollCbs.apply(null,args)
    else
      setTimeout (-> callScrollCbs.apply(null,args)), 66
callScrollCbs = ->
  for cb in allScrollCbs
    cb.apply(null,arguments)
  scrollRunning = false
window.addEventListener "scroll", scrollHandler

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
