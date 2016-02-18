# out: ../onWindowResize.js
resizeRunning = false
allResizeCbs = []
resizeHandler = ->
  unless resizeRunning
    resizeRunning = true
    if window.requestAnimationFrame
      window.requestAnimationFrame callResizeCbs
    else
      setTimeout callResizeCbs, 66
callResizeCbs = (e) ->
  for cb in allResizeCbs
    cb(e)
  resizeRunning = false
window.addEventListener "resize", resizeHandler

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
