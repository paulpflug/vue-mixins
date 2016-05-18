# out: ../getVue.js
Vue = null
module.exports =
  methods:
    'getVue': ->
      unless Vue?
        if @$root.constructor? # is Vue instance
          Vue = @$root.constructor
        else # is Vue-Component instance
          Vue = Object.getPrototypeOf(Object.getPrototypeOf(@$root)).constructor
      return Vue
