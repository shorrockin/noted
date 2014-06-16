React = require "react"
List  = require "./List"

{div, span}   = React.DOM
{form, input} = React.DOM

module.exports = React.createClass
  getInitialState: () ->
    { items: [], text: "" }

  onChange: (e) ->
    @setState { text: e.target.value }

  onSubmit: (e) ->
    e.preventDefault()
    if @state.text.trim() != ""
      @setState {
        items: [@state.text].concat(@state.items),
        text: ""
      }

  render: () ->
    div null,
      form className: "noted-form", onSubmit: @onSubmit,
        input {
          type: "text",
          placeholder: "Type a note and press enter",
          value: @state.text,
          onChange: @onChange
        }
      List items: @state.items
