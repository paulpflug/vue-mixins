// out: ..
<script lang="coffee">
module.exports =
  data: ->
    opacity: ""
    opacityValue: undefined
  methods:
    setOpacity: (value) ->
      if value?
        @opacity = "opacity:#{value};"
        @opacityValue = value
      else
        @opacity = ""
        @opacityValue = undefined
</script>
