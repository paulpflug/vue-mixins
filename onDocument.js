(function() {
  var onDocument;

  onDocument = function(event, cb, useCapture) {
    var remover;
    document.documentElement.addEventListener(event, cb, useCapture);
    remover = function() {
      document.documentElement.removeEventListener(event, cb);
      return remover = null;
    };
    return remover;
  };

  module.exports = {
    methods: {
      onDocument: onDocument
    }
  };

}).call(this);
