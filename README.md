# vue-mixins

A collection of mixins in vue.
Currently mainly used to replace `jQuery` in **vue-materialize**.

Designed for [**webpack**](https://webpack.github.io/) workflows.

## Policy

all sorts of mixins can be submitted. There will be no deprecation. If the API of a mixin changes the name has to change, for example `onResize` -> `onResize2`

## Install

```sh
npm install --save-dev vue-mixins

```
## Example
```coffee
## whithin your module
components:
  mixins:[
    require("vue-mixins/opacity")
  ]
```
```jade
//- in the template
div(style="{{opacity}}")
```
```coffee
## where you use it
moduleName.setOpacity(1)
```
## List of simple mixins
| Name | data | method |
| ---: | ---- | ------- |
|left  | `left` |`setLeft(number)`|
|right  | `right` |`setRight(number)`|
|opacity  | `opacity` `opacityValue`|`setOpacity(number)`|
|overflow  | `overflow` |`setOverflow(string)`|
|width  | `width` |`setWidth(number/string)`|
## Advanced mixins
### setCss
```js
// adds a method:
// setCss(element,cssProperty, cssValue)
// usage:
this.setCss(document.body,"overflow","hidden");

// remove overflow from style attribute
this.setCss(document.body,"overflow");
// or
this.setCss(document.body,"overflow", "");

```
### onResize
```js
// adds data "resizeRunning" and "resizeCbs"
// and three methods "addResizeCb", "resizeHandler" and "callResizeCbs"
// usage:
cleanUp = this.addResizeCb(function(){/*doSomethingOnResize;*/});
// remove your cb
cleanUp();
```
## Release History


 - *v0.0.1*: First release

## License
Copyright (c) 2015 Paul Pflugradt
Licensed under the MIT license.
