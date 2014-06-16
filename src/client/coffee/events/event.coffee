module.exports = (name, attributes...) ->
  out = class
    constructor: (values...) ->
      @event = name
      @_requires = attributes

      for attribute, index in @_requires
        this[attribute] = values[index]

  out.event = name
  return out
