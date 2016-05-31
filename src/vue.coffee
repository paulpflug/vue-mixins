# out: ../vue.js
module.exports =
  computed:
    Vue: ->
      return Object.getPrototypeOf(Object.getPrototypeOf(@)).constructor
