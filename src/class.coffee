# out: ../class.js
isString = (str) -> typeof str == 'string' or str instanceof String
processInput = (obj) ->
  isArray = Array.isArray(obj)
  if isString(obj) and not isArray
    obj = obj.split(" ")
    isArray = true
  return isArray:isArray, obj:obj
module.exports =
  computed:
    computedClass: ->
      { isArray: isArray1, obj: obj1 } = processInput(@class)
      return obj1 unless @mergeClass?
      { isArray: isArray2, obj: obj2 } = processInput(@mergeClass)
      if isArray1 and isArray2
        return obj2.concat obj1
      else
        result = {}
        if isArray2
          for item in obj2
            if isString(item)
              result[item] = true
            else
              for key,val of item
                result[key] = val
        else
          for key,val of obj2
            result[key] = val
        if isArray1
          for item in obj1
            if isString(item)
              result[item] = true
            else
              for key,val of item
                result[key] = val
        else
          for key,val of obj1
            result[key] = val
        return result
