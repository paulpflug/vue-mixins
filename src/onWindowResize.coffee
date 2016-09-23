# out: ../onWindowResize.js
allResizeCbs = []
callResizeCbs = ->
  for cb in allResizeCbs
    cb.apply(null,arguments)
  resizeRunning = false
require("./_throttledListener")("resize",callResizeCbs)

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
