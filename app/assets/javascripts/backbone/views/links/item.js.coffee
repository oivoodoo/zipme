class Shortlinks.Views.Links.Item extends Backbone.View
  tagName: 'tr'
  template: _.template($('#links-row').html())

  render: () ->
    html = @template(@model.toJSON())
    this.$el.html(html)

    return this

