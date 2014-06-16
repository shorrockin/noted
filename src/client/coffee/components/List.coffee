React    = require "react"
ListItem = require "./ListItem"

{ul} = React.DOM

module.exports = React.createClass
  render: () ->
    ul null, @props.items.map (content) ->
      ListItem(content: content)