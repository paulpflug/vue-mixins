# out: ../getVue.js
module.exports =
  methods:
    'getVue': ->
      return Object.getPrototypeOf(Object.getPrototypeOf(@)).constructor
