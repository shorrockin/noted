React = require "react"

{li} = React.DOM

module.exports = React.createClass
  render: () ->
    li null, @props.note.content