// out: ..
<script lang="coffee">
module.exports =
  methods:
    onDocumentClick: (cb) ->
      document.addEventListener "click", cb
      remover = ->
        document.removeEventListener "click", cb
        remover = null
      return remover
    onceDocumentClick: (cb) ->
      remover = null
      wrapper = (e) ->
        if cb(e)
          remover() if remover?
      document.addEventListener "click", wrapper
      remover = ->
        document.removeEventListener "click", wrapper
        remover = null
      return remover
</script>
