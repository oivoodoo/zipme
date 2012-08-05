class Shortlinks.Views.Links.Form extends Backbone.View
  events:
    'submit': 'create'

  initialize: () ->
    @url = this.$el.find('input[name="link[url]"]')

  create: (event) ->
    event.preventDefault()

    attributes = url: @url.val()
    options =
      success: (model) =>
        @url.val('')
        @collection.push(model)
      error: (message) -> console.log(message)

    model = new Shortlinks.Models.Link
    model.save attributes, options

