module.exports = {
  data: function() {
    return {
      width: ""
    };
  },
  methods: {
    setWidth: function(value) {
      if (value != null) {
        this.width = "width:" + value;
        if (typeof value === "number") {
          this.width += "px";
        }
        return this.width += ";";
      } else {
        return this.width = "";
      }
    }
  }
};

