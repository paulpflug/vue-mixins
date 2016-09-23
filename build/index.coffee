# out: ./index.js
mixins = {}
req = require.context("..",false,/.js$/)
for name in [
    "class"
    "dynamicCss"
    "fragToString"
    "getDocumentHeight"
    "getViewportOffset"
    "getViewportSize"
    "isOpened"
    "isOpened2"
    "onceDocument"
    "onClick"
    "onClickStack"
    "onClickStore"
    "onDocument"
    "onElementResize"
    "onMouseMove"
    "onWindowResize"
    "onWindowScroll"
    "parentListener"
    "setCss"
    "style"
    "transition"
    "vue"
    ]
  mixins[name] = req("./#{name}.js")
if module.exports != null
  module.exports = mixins
else
  window.vueMixins = mixins
