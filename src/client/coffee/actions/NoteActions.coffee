Dispatcher = require "../dispatchers/Dispatcher"
{Creating, Created, Destroy} = require "../events/NoteEvents"

id = 0

module.exports = {
  create: (content) ->
    id = id + 1 # faking it
    Dispatcher.fire(new Creating(content))
    Dispatcher.fire(new Created(id, content))

  destroy: (id) ->
    Dispatcher.fire(new Destroy(id))
}