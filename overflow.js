module.exports = {
  data: function() {
    return {
      overflow: ""
    };
  },
  methods: {
    setOverflow: function(value) {
      if (value != null) {
        return this.overflow = "overflow:" + value + ";";
      } else {
        return this.overflow = "";
      }
    }
  }
};

