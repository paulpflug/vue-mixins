(function() {
  var allResizeCbs, callResizeCbs, observer, resizeHandler, resizeRunning;

  resizeRunning = false;

  allResizeCbs = [];

  resizeHandler = function() {
    if (!resizeRunning) {
      resizeRunning = true;
      if (window.requestAnimationFrame) {
        return window.requestAnimationFrame(this.callResizeCbs);
      } else {
        return setTimeout(callResizeCbs, 66);
      }
    }
  };

  callResizeCbs = function(e) {
    var cb, i, len, ref;
    ref = this.llResizeCbs;
    for (i = 0, len = ref.length; i < len; i++) {
      cb = ref[i];
      cb(e);
    }
    return resizeRunning = false;
  };

  window.addEventListener("resize", this.resizeHandler);

  observer = new MutationObserver(resizeHandler);

  observer.observe(document.body, {
    attributes: true,
    childList: true,
    characterData: true,
    subtree: true
  });

  module.exports = {
    data: function() {
      return {
        resizeCbDisposables: []
      };
    },
    methods: {
      addResizeCb: function(cb) {
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
