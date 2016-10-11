# out: ../parentListener.js
module.exports =
  props:
    "ignoreParent":
      type: Boolean
      default: false
    "parent":
      type: Object
  data: ->
    removeParentClickListener: null
  methods:
    setupParent: (parent = @parent) ->
      unless @ignoreParent
        @removeParentClickListener?()
        parent.addEventListener "click", @onParentClick
        @removeParentClickListener = =>
          parent.removeEventListener "click", @onParentClick
  watch:
    "parent": "setupParent"
  mounted: -> @$nextTick ->
    unless @parent?
      @parent = @$el.parentElement
    else
      @setupParent()

  beforeDestroy: ->
    @removeParentClickListener?()
