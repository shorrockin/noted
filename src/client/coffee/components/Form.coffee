React       = require "react"
NoteStore   = require "../stores/NoteStore"
NoteActions = require "../actions/NoteActions"
{ Created } = require "../events/NoteEvents"

{form, input} = React.DOM

module.exports = React.createClass
  getInitialState: () ->
    { text: "" }

  onInputChanged: (e) ->
    @setState { text: e.target.value }

  componentDidMount: () ->
    NoteStore.on(Created, @clearText)

  componentDidUnmount: () ->
    NoteStore.removeOn(Created, @clearText)

  clearText: () ->
    @setState { text: "" }

  onSubmit: (e) ->
    e.preventDefault()

    if @state.text.trim() != ""
      NoteActions.create(@state.text)

  render: () ->
    form className: "noted-form", onSubmit: @onSubmit,
      input {
        type: "text",
        placeholder: "Type a note and press enter",
        value: @state.text,
        onChange: @onInputChanged
      }
