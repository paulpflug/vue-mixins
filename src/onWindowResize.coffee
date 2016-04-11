# out: ../onWindowResize.js
resizeRunning = false
allResizeCbs = []
resizeHandler = ->
  unless resizeRunning
    args = arguments
    resizeRunning = true
    if window.requestAnimationFrame
      window.requestAnimationFrame -> callResizeCbs.apply(null,args)
    else
      setTimeout (-> callResizeCbs.apply(null,args)), 66
callResizeCbs = ->
  for cb in allResizeCbs
    cb.apply(null,arguments)
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
