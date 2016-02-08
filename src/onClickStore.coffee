# out: ../onClickStore.js
module.exports =
  data: ->
    onClickStore: []
  methods:
    onClick: (cb) ->
      unless @onClickStore.indexOf(cb) > -1
        @onClickStore.push cb
      return =>
        index = @onClickStore.indexOf cb
        if index > -1
          @onClickStore.splice index,1
    click: (e) ->
      for fn in @onClickStore
        fn(e)
