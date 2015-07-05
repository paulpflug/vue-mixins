// out: ..
<script lang="coffee">
module.exports =
  data: ->
    width: ""
  methods:
    setWidth: (value) ->
      if value?
        @width = "width:#{value}"
        if typeof value == "number"
          @width += "px"
        @width += ";"
      else
        @width = ""
</script>
