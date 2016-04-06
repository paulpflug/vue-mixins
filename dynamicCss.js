(function() {
  var flatten, getRule, insertRule, removeRule, setRules, stylesheet, styletag;

  styletag = document.createElement('style');

  styletag.setAttribute('id', 'vm-dynamic-css');

  styletag.setAttribute("type", "text/css");

  document.head.appendChild(styletag);

  stylesheet = styletag.sheet ? styletag.sheet : styletag.styleSheet;

  flatten = function(obj, base) {
    var key, key2, key3, props, tmp, tmp2, val, val2, val3;
    if (base == null) {
      base = "";
    }
    tmp = {};
    for (key in obj) {
      val = obj[key];
      if (val instanceof Object) {
        props = {};
        for (key2 in val) {
          val2 = val[key2];
          if (key2.indexOf("&") > -1) {
            tmp2 = {};
            tmp2[key2.replace("&", "")] = val2;
            tmp2 = flatten(tmp2, base + key);
            for (key3 in tmp2) {
              val3 = tmp2[key3];
              tmp[key3] = val3;
            }
          } else {
            props[key2] = val2;
          }
        }
        tmp[base + key] = props;
      } else {
        tmp[base + key] = val;
      }
    }
    return tmp;
  };

  setRules = function(newRules) {
    var css, cssRule, index, ref, results, selector, singleRule, singleValue, str;
    newRules = flatten(newRules);
    results = [];
    for (selector in newRules) {
      css = newRules[selector];
      str = "";
      ref = getRule(selector), cssRule = ref.cssRule, index = ref.index;
      if (cssRule != null) {
        if (css != null) {
          results.push((function() {
            var results1;
            results1 = [];
            for (singleRule in css) {
              singleValue = css[singleRule];
              if (singleValue != null) {
                results1.push(cssRule.style.setProperty(singleRule, singleValue));
              } else {
                results1.push(cssRule.style.removeProperty(singleRule));
              }
            }
            return results1;
          })());
        } else {
          results.push(removeRule(index));
        }
      } else {
        if (css != null) {
          for (singleRule in css) {
            singleValue = css[singleRule];
            if (singleValue != null) {
              str += singleRule + ":" + singleValue + ";";
            }
          }
          results.push(insertRule(selector, str));
        } else {
          results.push(void 0);
        }
      }
    }
    return results;
  };

  getRule = function(selector) {
    var cssRule, cssRules, i, index, len;
    cssRules = stylesheet.cssRules || stylesheet.rules || [];
    for (index = i = 0, len = cssRules.length; i < len; index = ++i) {
      cssRule = cssRules[index];
      if (cssRule.selectorText === selector) {
        return {
          cssRule: cssRule,
          index: index
        };
      }
    }
    return {
      cssRule: null,
      index: null
    };
  };

  insertRule = function(selector, str) {
    selector = selector.toLowerCase();
    str = str.toLowerCase();
    if (stylesheet.insertRule) {
      return stylesheet.insertRule(selector + ' { ' + str + ' } ', stylesheet.cssRules.length);
    } else if (stylesheet.addRule) {
      return stylesheet.addRule(selector, str);
    }
  };

  removeRule = function(index) {
    if (stylesheet.removeRule) {
      return stylesheet.removeRule(index);
    } else {
      return stylesheet.deleteRule(index);
    }
  };

  module.exports = {
    methods: {
      'setCssRules': setRules
    }
  };

}).call(this);
