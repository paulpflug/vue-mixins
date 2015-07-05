module.exports = {
  data: function() {
    return {
      opacity: "",
      opacityValue: void 0
    };
  },
  methods: {
    setOpacity: function(value) {
      if (value != null) {
        this.opacity = "opacity:" + value + ";";
        return this.opacityValue = value;
      } else {
        this.opacity = "";
        return this.opacityValue = void 0;
      }
    }
  }
};

