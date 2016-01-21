module.exports = {
  data: function() {
    return {
      onClickStack: []
    };
  },
  methods: {
    addToClickStack: function(cb) {
      if (!(this.onClickStack.indexOf(cb) > -1)) {
        this.onClickStack.push(cb);
      }
      return (function(_this) {
        return function() {
          var index;
          index = _this.onClickStack.indexOf(cb);
          if (index > -1) {
            return _this.onClickStack.splice(index, 1);
          }
        };
      })(this);
    },
    click: function(e) {
      if (this.onClickStack.length >= 1) {
        return this.onClickStack[this.onClickStack.length - 1](e);
      }
    }
  }
};

