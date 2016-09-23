# out: ../onWindowScroll.js
allScrollCbs = []
callScrollCbs = ->
  for cb in allScrollCbs
    cb.apply(null,arguments)
require("./_throttledListener")("scroll",callScrollCbs)


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
