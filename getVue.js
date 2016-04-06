(function() {
  var Vue;

  Vue = null;

  module.exports = {
    methods: {
      'getVue': function() {
        if (Vue == null) {
          if (this.$root.construtor != null) {
            Vue = this.$root.construtor;
          } else {
            Vue = Object.getPrototypeOf(Object.getPrototypeOf(this.$root)).constructor;
          }
        }
        return Vue;
      }
    }
  };

}).call(this);
