events = require "events"

class Dispatcher
  constructor: () ->
    @_emitter = new events.EventEmitter()

  register: (event, cb) ->
    @_emitter.on(event, cb)

  dispatch: (event) ->
    @_emitter.emit(event)