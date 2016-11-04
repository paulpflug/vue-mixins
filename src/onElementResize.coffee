# out: ../onElementResize.js
called = []
disposes = []
fn = () ->
  args = arguments
  called.push args
  return ->
    i = called.indexOf args
    if i > -1
      called.splice i,1
    if disposes[i]?
      disposes[i]()
      disposes.splice i,1


if document? and window?
  document.addEventListener "DOMContentLoaded", ->
    if window.MutationObserver?
      allResizeCbs = []
      fn = (el, cb) ->
        elheight = el.offsetHeight
        elwidth = el.offsetWidth
        cbwrapper = ->
          if elheight != el.offsetHeight or elwidth != el.offsetWidth
            elheight = el.offsetHeight
            elwidth = el.offsetWidth
            cb.apply(null,arguments)
        allResizeCbs.push cbwrapper
        return ->
          index = allResizeCbs.indexOf cbwrapper
          if index > -1
            allResizeCbs.splice index,1
      callResizeCbs = ->
        for cb in allResizeCbs
          cb.apply(null,arguments)
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
      fn = (el, cb) ->
        window.addResizeListener(el,cb)
        return -> window.removeResizeListener(el,cb)
    for args,i in called
      disposes[i] = fn.apply(null, args)
module.exports =
  data: ->
    resizeCbDisposables: []
  methods:
    onElementResize: (el,cb) ->
      return unless cb?
      dispose = fn(el,cb)
      @resizeCbDisposables.push dispose
      return =>
        index = @resizeCbDisposables.indexOf dispose
        if index > -1
          @resizeCbDisposables.splice index,1
          dispose()

  beforeDestroy: ->
    for resizeCbDisposable in @resizeCbDisposables
      resizeCbDisposable()
