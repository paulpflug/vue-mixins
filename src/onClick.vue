// out: ..
<script lang="coffee">
module.exports =
  data: ->
    onClick: null
  methods:
    click: (e) ->
      if @onClick?
        @onClick(e)
</script>
