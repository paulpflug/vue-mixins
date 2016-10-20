# out: ../_throttledListener.js
fn = () ->
if window?
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
module.exports = fn
