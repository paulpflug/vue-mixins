(function() {
  module.exports = {
    data: function() {
      return {
        onClick: null
      };
    },
    methods: {
      click: function(e) {
        if (this.onClick != null) {
          return this.onClick(e);
        }
      }
    }
  };

}).call(this);
