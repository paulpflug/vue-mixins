// out: ..
<script lang="coffee">
module.exports =
  data: ->
    onClickStore: []
  methods:
    onClick: (cb, index = null) ->
      unless @onClickStore.indexOf(cb) > -1
        unless index?
          @onClickStore.push cb
        else
          @onClickStore.splice index,0,cb
      return =>
        index = @onClickStore.indexOf cb
        if index > -1
          @onClickStore.splice index,1
    click: (e) ->
      for fn in @onClickStore
        fn(e)
</script>
