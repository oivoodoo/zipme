class Shortlinks.Views.Links.List extends Backbone.View
  initialize: () ->
    @collection.on('add', @renderItem, @)

  render: () ->
    @collection.each(@add, @)
    @collection.bind('addSync', this.add, @)

  add: (model) ->
    view = new Shortlinks.Views.Links.Item(model: model)
    @.$el.append(view.render().el)

    context = @
    model.bind('update', () => @updateItem(view, model))

  updateItem: (view, model) ->
    view.model = model
    view.render()

