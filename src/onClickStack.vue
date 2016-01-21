// out: ..
<script lang="coffee">
module.exports =
  data: ->
    onClickStack: []
  methods:
    addToClickStack: (cb) ->
      @onClickStack.push(cb) unless @onClickStack.indexOf(cb) > -1
      return =>
        index = @onClickStack.indexOf cb
        if index > -1
          @onClickStack.splice index,1
    click: (e) ->
      if @onClickStack.length >= 1
        @onClickStack[@onClickStack.length-1](e)
</script>
