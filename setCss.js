(function() {
  var setCss;

  setCss = function(el, name, value) {
    var css, cssString, cssname, cssvalue, i, len, ref, splitted, str, style;
    if (!((el != null) && (name != null))) {
      return;
    }
    style = el.getAttribute("style");
    css = null;
    if (style != null) {
      splitted = style.split(";");
      css = {};
      for (i = 0, len = splitted.length; i < len; i++) {
        str = splitted[i];
        if (str) {
          ref = str.split(":"), cssname = ref[0], cssvalue = ref[1];
          css[cssname] = cssvalue;
        }
      }
      if ((value != null) && value !== "") {
        css[name] = value;
      } else if (css[name] != null) {
        delete css[name];
      }
    } else if ((value != null) && value !== "") {
      css = {};
      css[name] = value;
    }
    if ((css != null) && css.hasOwnProperty()) {
      cssString = "";
      for (name in css) {
        value = css[name];
        cssString += name + ":" + value + ";";
      }
      return el.setAttribute("style", cssString);
    } else {
      return el.removeAttribute("style");
    }
  };

  module.exports = {
    methods: {
      setCss: setCss
    }
  };

}).call(this);
