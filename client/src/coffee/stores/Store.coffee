EventEmitter = require("events").EventEmitter
events = require("../events/GenericEvents")

module.exports = class Store
  constructor: () ->
    @_emitter = new EventEmitter()

  on: (event, cb) ->
    @_emitter.on(event.event, cb)

  fire: (event) ->
    @_emitter.emit(event.event, event)

  removeOn: (event, cb) ->
    @_emitter.removeListener(event.event, cb)

  changed: () ->
    @fire(new events.Changed())