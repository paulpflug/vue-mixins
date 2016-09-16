# out: ../transition.js
module.exports =
  mixins: [
    require("./vue")
  ]
  props:
    transition:
      type: String
  computed:
    cTransition: ->
      name = @transition
      name ?= "default"
      @processTransition(name)
      return name
  methods:
    processTransition: (value, parent = @$parent) ->
      hooks = @Vue.util.resolveAsset(parent.$options,'transitions',value)
      if hooks?
        newHooks =
          enterClass: hooks.enterClass
          leaveClass: hooks.leaveClass
          leave: hooks.leave
          enterCancelled: hooks.enterCancelled
          leaveCancelled: hooks.leaveCancelled

      else
        newHooks = {}
      addHook = (name) =>
        eventName = @Vue.util.hyphenate(name)
        if hooks?[name]?
          hook = hooks[name]
          fn = (el) =>
            @$emit eventName
            hook.bind(@)(el)
        else
          fn = (el) =>
            @$emit eventName
        newHooks[name] = fn
      for hook in ["afterEnter","beforeLeave","afterLeave"]
        addHook(hook)
      if hooks?.enter? and hooks.enter.length == 2
        hook = hooks.enter
        newHooks.enter = (el,cb) =>
          @$emit "before-enter"
          hook.bind(@)(el,cb)
      else if hooks?.enter?
        hook = hooks.enter
        newHooks.enter = (el) =>
          @$emit "before-enter"
          hook.bind(@)(el)
      else
        newHooks.enter = (el) => @$emit "before-enter"
      @$options.transitions[value] = newHooks
