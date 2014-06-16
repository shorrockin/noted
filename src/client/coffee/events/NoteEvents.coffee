event = require "./event"

module.exports = {
  Creating: event("note.creating", "content")
  Created:  event("note.created", "id", "content")
  Destroy:  event("note.destroyed", "id")
}
