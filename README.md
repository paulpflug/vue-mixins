# vue-mixins

A collection of mixins in vue.
Mainly used to replace `jQuery` in [**vue-materialize**](https://github.com/paulpflug/vue-materialize).

Designed for [**webpack**](https://webpack.github.io/) workflows.

## Policy

all sorts of mixins can be submitted. There will be no removes because of deprecation. If the API of a mixin changes the name has to change, for example `onResize` -> `onResize2`

## Install

```sh
npm install --save-dev vue-mixins

```
## Usage
```coffee
## whithin your module
components:
  mixins:[
    require("vue-mixins/onClick")
  ]
```
## List of mixins
| Name | description |
| ---: |  ------- |
| getViewportSize | adds a method `getViewportSize` which returns an object containing the `width` and `height` of the viewport |
| onceDocument | adds a eventListener to the document which removes itself after first successful call|
| onClick  | adds a method `click` which will call the function `onClick` if set |
| onClickStack  | adds two methods: `click` and `addToClickStack` |
| onClickStore  | adds two methods: `click` and `onClick` (see below) |
| onDocument  | like `onceDocument` but doesn't removes itself |
| onResize | deprecated |
| onWindowResize | fires on resize of window |
| onElementResize | fires on resize of window or element, but only if the dimensions of the element changed |
| setCss | set Css of another element |

## Detailed usage
### getViewportSize
```js
// adds a method:
// getViewportSize()
// usage:
vs = this.getViewportSize();
vs.width
vs.height
```
### onceDocument
```js
// adds a method:
// onceDocument(event, cb, useCapture)
// usage:
dispose = this.onceDocument('click',function(e){
  doSomething()
  // return true will remove the listener
  // return false will not remove the listener
  },false);
dispose() // will remove the listener
```
### onClick
```js
// adds a method:
// click(event) which will call this.onClick(e) if available
// usage:
this.onClick = function(e) {doSomething()}
```
```html
<!-- in template -->
<div @click="click"></div>
```

### onClickStack
```js
// adds two methods:
// - click(event) will call the last function in this.onClickStack if available
// - addToClickStack(fn) will add a function to this.onClickStack and return a function to dispose it
// usage:
var dispose = null
var cb = function(e) {
  doSomething()
  dispose() // to remove from stack
}
dispose = this.addToClickStack(cb)
```
```html
<!-- in template -->
<div @click="click"></div>
```

### onClickStore
```js
// adds two methods:
// - click(event) will call all functions in this.onClickStore
// - onClick(fn) will add a function to this.onClickStore and return a function to dispose it
// usage:
var dispose = null
var cb = function(e) {
  doSomething()
  dispose() // to remove from store
}
dispose = this.onClickStore(cb)
```
```html
<!-- in template -->
<div @click="click"></div>
```
### onDocument
like `onceDocument`, but doesn't remove itself on first successful invokation.

### onWindowResize
```js
// adds a method: onWindowResize(cb) which will return a function to dispose it
// usage:
dispose = this.onWindowResize(function(){/*doSomethingOnElementResize;*/});
// remove your cb
dispose();
```

### onElementResize
```js
// adds a method: onElementResize(el, cb) which will return a function to dispose it
// usage:
dispose = this.onElementResize(el, function(){/*doSomethingOnElementResize;*/});
// remove your cb
dispose();
```


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

## Develop
Clone rep
```
npm install
```
Available scripts:
```
npm run build # compiles coffee-script in src/
npm run test # runs a single-run karma in chrome and firefox
npm run watch # runs karma in chrome (uses src/*.coffee files direclty, no need for build)

# to run only single tests:
karma start --browsers Chrome --auto-watch --reporters spec --files ['test/onClick.coffee']
```

## License
Copyright (c) 2015 Paul Pflugradt
Licensed under the MIT license.
