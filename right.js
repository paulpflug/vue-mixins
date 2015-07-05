module.exports = {
  data: function() {
    return {
      right: ""
    };
  },
  methods: {
    setRight: function(value) {
      if (value != null) {
        return this.right = "right:" + value + "px;";
      } else {
        return this.right = "";
      }
    }
  }
};

