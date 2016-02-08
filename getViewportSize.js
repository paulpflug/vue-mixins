(function() {
  var getViewportSize;

  getViewportSize = function() {
    var a, e;
    if (window.innerWidth != null) {
      e = window;
      a = 'inner';
    } else {
      a = 'client';
      e = document.documentElement || document.body;
    }
    return {
      width: e[a + 'Width'],
      height: e[a + 'Height']
    };
  };

  module.exports = {
    methods: {
      getViewportSize: getViewportSize
    }
  };

}).call(this);
