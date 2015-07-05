// out: ..
<script lang="coffee">
module.exports =
  methods:
    setCss: (el, name, value) ->
      return unless el? and name?
      style = el.getAttribute("style")
      css = null
      if style?
        splitted = style.split(";")
        css = {}
        for str in splitted
          if str
            [cssname,cssvalue] = str.split(":")
            css[cssname] = cssvalue
        if value? and value != ""
          css[name] = value
        else if css[name]?
          delete css[name]
      else if value? and value != ""
        css = {}
        css[name] = value
      if css? and css.hasOwnProperty()
        cssString = ""
        for name,value of css
          cssString += "#{name}:#{value};"
        el.setAttribute("style", cssString)
      else
        el.removeAttribute("style")

</script>
