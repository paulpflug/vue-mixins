# out: ../onElementResize.js
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
    onElementResize: (el,cb) ->
      return unless el?
      elheight = el.offsetHeight
      elwidth = el.offsetWidth
      cbwrapper = (e) ->
        if elheight != el.offsetHeight or elwidth != el.offsetWidth
          elheight = el.offsetHeight
          elwidth = el.offsetWidth
          cb(e)
      allResizeCbs.push cbwrapper
      dispose = ->
        index = allResizeCbs.indexOf cbwrapper
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
