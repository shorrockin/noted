Store                = require "./Store"
Dispatcher           = require "../dispatchers/Dispatcher"
{ Created, Destroy } = require "../events/NoteEvents"
{ Changed }          = require "../events/GenericEvents"

class NoteStore extends Store
  constructor: () ->
    super()

    @_items = []

    Dispatcher.on Created, (event) =>
      @_items.unshift { id: event.id, content: event.content }
      @changed()
      @fire(event)

    Dispatcher.on Destroy, (event) =>
      @changed()
      @fire(event)

  all: () ->
    @_items

module.exports = new NoteStore()
