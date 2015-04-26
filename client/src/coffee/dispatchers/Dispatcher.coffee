EventEmitter = require("events").EventEmitter

class Dispatcher
  constructor: () ->
    @_emitter = new EventEmitter()

  on: (event, cb) ->
    @_emitter.on(event.event, cb)

  fire: (event) ->
    @_emitter.emit(event.event, event)

module.exports = new Dispatcher()