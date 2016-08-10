# out: ../class.js
isString = (str) -> typeof str == 'string' or str instanceof String
processInput = (obj) ->
  isArray = Array.isArray(obj)
  if isString(obj) and not isArray
    obj = [obj]
    isArray = true
  return isArray:isArray, obj:obj
module.exports =
  computed:
    computedClass: ->
      return @class unless @mergeClass?
      { isArray: isArray1, obj: obj1 } = processInput(@class)
      { isArray: isArray2, obj: obj2 } = processInput(@mergeClass)
      if isArray1 and isArray2
        return @mergeClass.concat @class
      else
        result = {}
        if isArray2
          for item in @mergeClass
            if isString(item)
              result[item] = true
            else
              for key,val of item
                result[key] = val
        else
          for key,val of @mergeClass
            result[key] = val
        if isArray1
          for item in @class
            if isString(item)
              result[item] = true
            else
              for key,val of item
                result[key] = val
        else
          for key,val of @class
            result[key] = val
        return result
