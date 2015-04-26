request = require "superagent"
Dispatcher = require "../dispatchers/Dispatcher"
{Init, Creating, Created, Destroy} = require "../events/NoteEvents"

module.exports = {
  init: () ->
    # TODO figure out better means to populate the server
    # url. currently in testing we use browser sync to server
    # pages from different port, so relative url won't work
    # TODO probably should have a single batch updated instead
    # of iterating.
    # TODO error handling
    request.get("/api/notes").end (error, result) ->
      for note in result.body
        Dispatcher.fire(new Created(note.id, note.content))


  create: (content) ->
    Dispatcher.fire(new Creating(content))
    request.post("/api/notes").send(content).end (error, result) ->
      Dispatcher.fire(new Created(result.body.id, result.body.content))

  destroy: (id) ->
    Dispatcher.fire(new Destroy(id))
}