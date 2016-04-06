# out: ../getVue.js
Vue = null
module.exports =
  methods:
    'getVue': ->
      unless Vue?
        if @$root.construtor? # is Vue instance
          Vue = @$root.construtor
        else # is Vue-Component instance
          Vue = Object.getPrototypeOf(Object.getPrototypeOf(@$root)).constructor
      return Vue
