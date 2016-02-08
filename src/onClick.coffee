# out: ../onClick.js
module.exports =
  data: ->
    onClick: null
  methods:
    click: (e) ->
      if @onClick?
        @onClick(e)
