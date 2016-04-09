# out: ../getViewportOffset.js
# https://gist.github.com/jlong/eff01958791d3e0bf10c
obj = require "./getViewportSize"
getViewportSize = obj.methods.getViewportSize
getViewportOffset = (element = @$el) ->
  left = element.offsetLeft
  top = element.offsetTop
  el = element.parentElement
  while el
    styles = getComputedStyle el
    if styles
      position = styles.getPropertyValue 'position'
      left -= el.scrollLeft
      top -= el.scrollTop
      if /relative|absolute|fixed/.test(position)
        left += parseInt(styles.getPropertyValue('border-left-width'), 10)
        top += parseInt(styles.getPropertyValue('border-top-width'), 10)
        left += el.offsetLeft
        top += el.offsetTop
        break if position == 'fixed'
    el = el.parentElement
  viewportSize = getViewportSize()
  return {
    top: top
    bottom: viewportSize.height-element.offsetHeight-top
    left: left
    right: viewportSize.width-element.offsetWidth-left
  }

module.exports =
  methods:
    getViewportOffset: getViewportOffset
