vueMixins = {
  class: require('./class.js'),
  dynamicCss: require('./dynamicCss.js'),
  getDocumentHeight: require('./getDocumentHeight.js'),
  getViewportOffset: require('./getViewportOffset.js'),
  getViewportSize: require('./getViewportSize.js'),
  isOpened: require('./isOpened.js'),
  onceDocument: require('./onceDocument.js'),
  onClick: require('./onClick.js'),
  onClickStack: require('./onClickStack.js'),
  onClickStore: require('./onClickStore.js'),
  onDocument: require('./onDocument.js'),
  onElementResize: require('./onElementResize.js'),
  onWindowResize: require('./onWindowResize.js'),
  onWindowScroll: require('./onWindowScroll.js'),
  parentListener: require('./parentListener.js'),
  setCss: require('./setCss.js'),
  style: require('./style.js'),
  vue: require('./vue.js'),
}
if (module.exports != null){
  module.exports = vueMixins
} else {
  window.vueMixins = vueMixins
}
