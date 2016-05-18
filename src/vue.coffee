# out: ../vue.js
Vue = null
module.exports =
  computed:
    Vue: ->
      unless Vue?
        if @$root.constructor? # is Vue instance
          Vue = @$root.constructor
        else # is Vue-Component instance
          Vue = Object.getPrototypeOf(Object.getPrototypeOf(@$root)).constructor
      return Vue
