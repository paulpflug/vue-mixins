// out: ..
<script lang="coffee">
module.exports =
  data: ->
    left: ""
  methods:
    setLeft: (value) ->
      if value?
        @left = "left:#{value}px;"
      else
        @left = ""
</script>
