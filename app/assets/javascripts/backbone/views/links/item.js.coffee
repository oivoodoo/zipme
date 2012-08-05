class Shortlinks.Views.Links.Item extends Backbone.View
  tagName: 'tr'
  template: JST['backbone/templates/links/item']

  initialize: () ->
    this.$el.attr('id', "link_#{@model.id}")

  render: () ->
    html = @template(@model.templateJSON())
    this.$el.html(html)

    return this

