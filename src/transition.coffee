# out: ../transition.js
module.exports =
  mixins: [
    require("./vue")
  ]
  computed:
    cTransition: ->
      if @disableTransition
        name = "empty"
      else
        name = @transition
      @processTransition(name)
      return name
  methods:
    processTransition: (value, parent = @$parent) ->
      unless value == "empty"
        hooks = @Vue.util.resolveAsset(parent.$options,'transitions',value)
      unless hooks?
        hooks ?= @$options.transitions[value]
        return if hooks?.modified
      if hooks?
        newHooks =
          enterClass: hooks.enterClass
          leaveClass: hooks.leaveClass
          leave: hooks.leave
          beforeEnter: hooks.beforeEnter
      else
        newHooks = {}
      newHooks.modified = true
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
      for hook in ["afterEnter","beforeLeave","afterLeave","enterCancelled","leaveCancelled"]
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
