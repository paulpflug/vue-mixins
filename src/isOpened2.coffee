# out: ../isOpened.js
module.exports =
  props:
    "isOpened":
      type: Boolean
      default: false
  data: ->
    opened: @isOpened
  methods:
    setOpened: ->
      @opened = true
      @$emit "toggled", true
    setClosed: ->
      @opened = false
      @$emit "toggled", false
  watch:
    "isOpened": (val) ->
      if val != @opened
        @toggle()
