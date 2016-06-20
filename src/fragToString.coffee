# out: ../fragToString.js
module.exports =
  methods:
    fragToString: (frag) ->
      div = document.createElement "div"
      div.appendChild frag.cloneNode(true)
      return div.innerHTML
