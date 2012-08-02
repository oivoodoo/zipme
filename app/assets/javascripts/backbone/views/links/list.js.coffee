class Shortlinks.Views.Links.List extends Backbone.View
  render: () ->
    context = this

    @collection.each((item) ->
      view = new Shortlinks.Views.Links.Item(model: item)
      context.$el.append(view.render().el)
    )

