module.exports = {
  data: function() {
    return {
      onClickStore: []
    };
  },
  methods: {
    onClick: function(cb, index) {
      if (index == null) {
        index = null;
      }
      if (!(this.onClickStore.indexOf(cb) > -1)) {
        if (index == null) {
          this.onClickStore.push(cb);
        } else {
          this.onClickStore.splice(index, 0, cb);
        }
      }
      return (function(_this) {
        return function() {
          index = _this.onClickStore.indexOf(cb);
          if (index > -1) {
            return _this.onClickStore.splice(index, 1);
          }
        };
      })(this);
    },
    click: function(e) {
      var fn, i, len, ref, results;
      ref = this.onClickStore;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        fn = ref[i];
        results.push(fn(e));
      }
      return results;
    }
  }
};

