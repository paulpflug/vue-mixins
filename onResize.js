module.exports = {
  data: function() {
    return {
      resizeRunning: false,
      resizeCbs: []
    };
  },
  methods: {
    addResizeCb: function(cb) {
      this.resizeCbs.push(cb);
      return (function(_this) {
        return function() {
          var index;
          index = _this.resizeCbs.indexOf(cb);
          if (index > -1) {
            return _this.resizeCbs.splice(index, 1);
          }
        };
      })(this);
    },
    resizeHandler: function() {
      if (!this.resizeRunning) {
        this.resizeRunning = true;
        if (window.requestAnimationFrame) {
          return window.requestAnimationFrame(this.callResizeCbs);
        } else {
          return setTimeout(this.callResizeCbs, 66);
        }
      }
    },
    callResizeCbs: function() {
      var cb, i, len, ref;
      ref = this.resizeCbs;
      for (i = 0, len = ref.length; i < len; i++) {
        cb = ref[i];
        cb();
      }
      return this.resizeRunning = false;
    }
  },
  compiled: function() {
    return window.addEventListener("resize", this.resizeHandler);
  },
  beforeDestroy: function() {
    return window.removeEventListener("resize", this.resizeHandler);
  }
};

