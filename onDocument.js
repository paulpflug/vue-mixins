module.exports = {
  methods: {
    onDocument: function(event, cb, useCapture) {
      var remover;
      document.documentElement.addEventListener(event, cb, useCapture);
      remover = function() {
        document.documentElement.removeEventListener(event, cb);
        return remover = null;
      };
      return remover;
    },
    onceDocument: function(event, cb, useCapture) {
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
    }
  }
};

