class Shortlinks.Views.Links.Edit extends Backbone.View
  template: JST['backbone/templates/links/edit']
  events:
    'submit': 'update'
    'click .cancel': 'cancel'

  render: () ->
    html = @template(@model.toJSON())
    this.$el.html(html)

    @key = this.$el.find('input[name="link[key]"]')

    return this

  update: (event) ->
    event.preventDefault()

    attributes = key: @key.val()
    options =
      success: (model) => @key.val('')
      error: (message) -> console.log(message)

    @model.save attributes, options

  cancel: (event) ->
    event.preventDefault()

    @view = new Shortlinks.Views.Links.Item(model: @model)
    $("#link_#{@model.id}").replaceWith(@view.render().el)

    router.navigate('/')

