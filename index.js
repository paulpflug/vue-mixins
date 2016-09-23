vueMixins = {
  class: require('./class.js'),
  dynamicCss: require('./dynamicCss.js'),
  fragToString: require('./fragToString.js'),
  getDocumentHeight: require('./getDocumentHeight.js'),
  getViewportOffset: require('./getViewportOffset.js'),
  getViewportSize: require('./getViewportSize.js'),
  isOpened: require('./isOpened.js'),
  isOpened2: require('./isOpened2.js'),
  onceDocument: require('./onceDocument.js'),
  onClick: require('./onClick.js'),
  onClickStack: require('./onClickStack.js'),
  onClickStore: require('./onClickStore.js'),
  onDocument: require('./onDocument.js'),
  onElementResize: require('./onElementResize.js'),
  onMouseMove: require('./onMouseMove.js'),
  onWindowResize: require('./onWindowResize.js'),
  onWindowScroll: require('./onWindowScroll.js'),
  parentListener: require('./parentListener.js'),
  setCss: require('./setCss.js'),
  style: require('./style.js'),
  transition: require("./transition.js")
  vue: require('./vue.js'),
}
if (module.exports != null){
  module.exports = vueMixins
} else {
  window.vueMixins = vueMixins
}
