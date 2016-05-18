# out: ../vue.js
Vue = null
module.exports =
  computed:
    Vue: ->
      unless Vue?
        constructor = @$root.constructor
        if constructor.toString().match /Component/
          Vue = Object.getPrototypeOf(Object.getPrototypeOf(@$root)).constructor
        else
          Vue = constructor
      return Vue
