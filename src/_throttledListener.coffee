# out: ../_throttledListener.js
called = []
fn = () -> called.push arguments
if document? and window?
  document.addEventListener "DOMContentLoaded", ->
    rAF = window.requestAnimationFrame ||
          window.mozRequestAnimationFrame ||
          window.webkitRequestAnimationFrame ||
          window.msRequestAnimationFrame

    cAF = window.cancelAnimationFrame ||
          window.mozCancelAnimationFrame
    if rAF
      fn = (event, cb) ->
        lastRequest = null
        window.addEventListener event, ->
          args = arguments
          cAF(lastRequest)
          lastRequest = rAF -> cb.apply(null, args)
    else
      throttle = require("lodash/throttle")
      fn = (event, cb) ->
        window.addEventListener event, throttle(cb, 66)
    for args in called
      fn.apply(null, args)
module.exports = fn
