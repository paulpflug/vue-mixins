(function() {
  var onceDocument;

  onceDocument = function(event, cb, useCapture) {
    var remover, wrapper;
    remover = null;
    wrapper = function(e) {
      if (cb(e)) {
        if (remover != null) {
          return remover();
        }
      }
    };
    document.documentElement.addEventListener(event, wrapper, useCapture);
    remover = function() {
      document.documentElement.removeEventListener(event, wrapper);
      return remover = null;
    };
    return remover;
  };

  module.exports = {
    methods: {
      onceDocument: onceDocument
    }
  };

}).call(this);
