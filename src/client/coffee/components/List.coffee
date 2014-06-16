React        = require "react"
ListItem     = require "./ListItem"
NoteStore    = require "../stores/NoteStore"
NoteActions  = require "../actions/NoteActions"
{ Changed }  = require("../events/GenericEvents")

{ul} = React.DOM

module.exports = React.createClass
  getInitialState: () ->
    { items: NoteStore.all() }

  componentDidMount: () ->
    NoteStore.on(Changed, this.onItemsChanged)

  componentDidUnmount: () ->
    NoteStore.removeOn(Changed, this.onItemsChanged)

  onItemsChanged: (e) ->
    @setState { items: NoteStore.all() }

  render: () ->
    ul null, @state.items.map (note) ->
      ListItem(key: note.id, note: note)