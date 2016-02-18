(function() {
  var allResizeCbs, callResizeCbs, resizeHandler, resizeRunning;

  resizeRunning = false;

  allResizeCbs = [];

  resizeHandler = function() {
    if (!resizeRunning) {
      resizeRunning = true;
      if (window.requestAnimationFrame) {
        return window.requestAnimationFrame(callResizeCbs);
      } else {
        return setTimeout(callResizeCbs, 66);
      }
    }
  };

  callResizeCbs = function(e) {
    var cb, i, len;
    for (i = 0, len = allResizeCbs.length; i < len; i++) {
      cb = allResizeCbs[i];
      cb(e);
    }
    return resizeRunning = false;
  };

  window.addEventListener("resize", resizeHandler);

  module.exports = {
    data: function() {
      return {
        resizeCbDisposables: []
      };
    },
    methods: {
      onWindowResize: function(cb) {
        var dispose;
        allResizeCbs.push(cb);
        dispose = function() {
          var index;
          index = allResizeCbs.indexOf(cb);
          if (index > -1) {
            return allResizeCbs.splice(index, 1);
          }
        };
        this.resizeCbDisposables.push(dispose);
        return (function(_this) {
          return function() {
            var index;
            dispose();
            index = _this.resizeCbDisposables.indexOf(dispose);
            if (index > -1) {
              return _this.resizeCbDisposables.splice(index, 1);
            }
          };
        })(this);
      }
    },
    beforeDestroy: function() {
      var i, len, ref, resizeCbDisposable, results;
      ref = this.resizeCbDisposables;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        resizeCbDisposable = ref[i];
        results.push(resizeCbDisposable());
      }
      return results;
    }
  };

}).call(this);
