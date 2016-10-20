# out: ../onResize.js
if window
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
  observer = new MutationObserver resizeHandler
  observer.observe document.body,
    attributes: true
    childList: true
    characterData: true
    subtree: true

module.exports =
  data: ->
    resizeCbDisposables: []
  methods:
    addResizeCb: (cb) ->
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
