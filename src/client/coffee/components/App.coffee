React = require "react"
List  = require "./List"
Form  = require "./Form"

{div, span} = React.DOM

module.exports = React.createClass
  render: () ->
    div null,
      Form null, null
      List null, null
