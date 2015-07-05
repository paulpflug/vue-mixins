// out: ..
<script lang="coffee">
module.exports =
  data: ->
    overflow: ""
  methods:
    setOverflow: (value) ->
      if value?
        @overflow = "overflow:#{value};"
      else
        @overflow = ""
</script>
