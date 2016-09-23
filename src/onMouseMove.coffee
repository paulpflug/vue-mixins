# out: ../onMouseMove.js
allMouseMoveCbs = []
callMouseMoveCbs = ->
  for cb in allMouseMoveCbs
    cb.apply(null,arguments)
require("./_throttledListener")("mousemove",callMouseMoveCbs)
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
