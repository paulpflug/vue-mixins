module.exports = {
  methods: {
    onDocumentClick: function(cb) {
      var remover;
      document.addEventListener("click", cb);
      remover = function() {
        document.removeEventListener("click", cb);
        return remover = null;
      };
      return remover;
    },
    onceDocumentClick: function(cb) {
      var remover, wrapper;
      remover = null;
      wrapper = function(e) {
        if (cb(e)) {
          if (remover != null) {
            return remover();
          }
        }
      };
      document.addEventListener("click", wrapper);
      remover = function() {
        document.removeEventListener("click", wrapper);
        return remover = null;
      };
      return remover;
    }
  }
};

