React = require "react"
List  = require "./List"

{div, span}   = React.DOM
{form, input} = React.DOM


App = React.createClass
  getInitialState: () ->
    { items: [], text: "" }

  onChange: (e) ->
    @setState { text: e.target.value }

  onSubmit: (e) ->
    e.preventDefault()
    @state.items.unshift(@state.text)
    @setState {
      items: @state.items,
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

module.exports = App
