vueMixins = {
  getViewportSize: require('./getViewportSize.js'),
  onceDocument: require('./onceDocument.js'),
  onClick: require('./onClick.js'),
  onClickStack: require('./onClickStack.js'),
  onClickStore: require('./onClickStore.js'),
  onDocument: require('./onDocument.js'),
  onElementResize: require('./onElementResize.js'),
  onWindowResize: require('./onWindowResize.js'),
  setCss: require('./setCss.js'),
}
if (module.exports != null){
  module.exports = vueMixins
} else {
  window.vueMixins = vueMixins
}
