// out: ..
<script lang="coffee">
module.exports =
  data: ->
    right: ""
  methods:
    setRight: (value) ->
      if value?
        @right = "right:#{value}px;"
      else
        @right = ""
</script>
