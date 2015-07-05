module.exports = {
  data: function() {
    return {
      left: ""
    };
  },
  methods: {
    setLeft: function(value) {
      if (value != null) {
        return this.left = "left:" + value + "px;";
      } else {
        return this.left = "";
      }
    }
  }
};

