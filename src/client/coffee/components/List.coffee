React = require "react"

{ul, li} = React.DOM

List = React.createClass
  render: () ->
    createItem = (text) ->
      li null, text

    ul null, @props.items.map(createItem)

module.exports = List