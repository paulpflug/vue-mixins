// out: ..
<script lang="coffee">
module.exports =
  methods:
    onDocument: (event, cb, useCapture) ->
      document.documentElement.addEventListener event, cb, useCapture
      remover = ->
        document.documentElement.removeEventListener event, cb
        remover = null
      return remover
    onceDocument: (event, cb, useCapture) ->
      remover = null
      wrapper = (e) ->
        if cb(e)
          remover() if remover?
      document.documentElement.addEventListener event, wrapper, useCapture
      remover = ->
        document.documentElement.removeEventListener event, wrapper
        remover = null
      return remover
</script>
