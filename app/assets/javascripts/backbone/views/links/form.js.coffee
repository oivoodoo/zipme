class Shortlinks.Views.Links.Form extends Backbone.View
  events:
    'submit': 'create'

  initialize: () ->
    @url = this.$el.find('input[name="link[url]"]')

  create: (event) ->
    event.preventDefault()

    context = @

    model = new Shortlinks.Models.Link
    model.save(
      { url: @url.val() },

      success: (model) ->
        context.url.val('')
        context.collection.push(model)
        # Show success notification on the form
      error: (message) ->
        # Show error view on the form
        console.log(message)
    )

