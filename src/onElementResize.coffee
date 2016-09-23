# out: ../onElementResize.js

hasMutationObserver = !!window.MutationObserver
if hasMutationObserver

  allResizeCbs = []
  callResizeCbs = (e) ->
    for cb in allResizeCbs
      cb(e)
    resizeRunning = false
  require("./_throttledListener")("resize",callResizeCbs)
  throttle = require("lodash/throttle")
  observer = new MutationObserver throttle(callResizeCbs,66)
  observer.observe document.body,
    attributes: true
    childList: true
    characterData: true
    subtree: true
else
  require "javascript-detect-element-resize"

module.exports =
  data: ->
    resizeCbDisposables: []
  methods:
    onElementResize: (el,cb) ->
      return unless cb?
      if hasMutationObserver
        elheight = el.offsetHeight
        elwidth = el.offsetWidth
        cbwrapper = (e) ->
          if elheight != el.offsetHeight or elwidth != el.offsetWidth
            elheight = el.offsetHeight
            elwidth = el.offsetWidth
            cb(e)
        allResizeCbs.push cbwrapper
      else
        window.addResizeListener(el,cb)
      dispose = ->
        if hasMutationObserver
          index = allResizeCbs.indexOf cbwrapper
          if index > -1
            allResizeCbs.splice index,1
        else
          window.removeResizeListener(el,cb)
      @resizeCbDisposables.push dispose
      return =>
        index = @resizeCbDisposables.indexOf dispose
        if index > -1
          @resizeCbDisposables.splice index,1
          dispose()

  beforeDestroy: ->
    for resizeCbDisposable in @resizeCbDisposables
      resizeCbDisposable()
