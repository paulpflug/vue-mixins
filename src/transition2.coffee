# out: ../transition.js
module.exports =
  mixins: [
    require("./vue")
  ]
  computed:
    cTransition: ->
      return @processTransition(@transition)
    cTransitionGroup: ->
      return @processTransitionGroup(@transition)
  methods:
    processTransitionGroup: (name, options = {}) ->
      options.defaultName ?= "transition-group"
      @processTransition name, options
    processTransition: (name, options = {}) ->
      {parent=@$parent, defaultName="transition"} = options
      parent ?= @
      comp = @Vue.util.resolveAsset(parent.$options,'components',name)
      if parent != @ and not comp?
        comp = @Vue.util.resolveAsset(@$options,'components',name)
      if comp?
        @$options.components[name] = comp
      else
        name = defaultName
      return name
