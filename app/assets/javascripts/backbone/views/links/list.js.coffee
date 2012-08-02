class Shortlinks.Views.Links.List extends Backbone.View
  initialize: () ->
    @collection.on('add', @renderItem, @)

  render: () ->
    @collection.each(@add, @)
    @collection.bind('add', this.add, @)

  add: (item) ->
    view = new Shortlinks.Views.Links.Item(model: item)
    @.$el.append(view.render().el)

