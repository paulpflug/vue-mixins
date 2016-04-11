# out: ../getDocumentHeight.js

getDocumentHeight = ->
  body = document.body
  html = document.documentElement
  return document.height or Math.max(body.scrollHeight,
    body.offsetHeight,
    html.clientHeight,
    html.scrollHeight,
    html.offsetHeight)

module.exports =
  methods:
    getDocumentHeight: getDocumentHeight
