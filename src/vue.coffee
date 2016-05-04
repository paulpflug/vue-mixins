# out: ../vue.js
Vue = null
module.exports =
  computed:
    Vue: ->
      unless Vue?
        if @$root.construtor? # is Vue instance
          Vue = @$root.construtor
        else # is Vue-Component instance
          Vue = Object.getPrototypeOf(Object.getPrototypeOf(@$root)).constructor
      return Vue
