// out: ..
<script lang="coffee">
module.exports =
  data: ->
    resizeRunning: false
    resizeCbs: []
  methods:
    addResizeCb: (cb) ->
      @resizeCbs.push cb
      return =>
        index = @resizeCbs.indexOf cb
        if index > -1
          @resizeCbs.splice index,1
    resizeHandler: ->
      unless @resizeRunning
        @resizeRunning = true
        if window.requestAnimationFrame
          window.requestAnimationFrame @callResizeCbs
        else
          setTimeout @callResizeCbs, 66
    callResizeCbs: ->
      for cb in @resizeCbs
        cb()
      @resizeRunning = false
  compiled: ->
    window.addEventListener "resize", @resizeHandler
  beforeDestroy: ->
    window.removeEventListener "resize", @resizeHandler
</script>
