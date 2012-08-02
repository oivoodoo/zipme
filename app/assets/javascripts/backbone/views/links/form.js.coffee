class Shortlinks.Views.Links.Form extends Backbone.View
  events:
    'submit': 'create'

  create: (event) ->
    event.preventDefault()

    @model.save(
      success: () ->
        # Show success notification on the form
      error: (message) ->
        # Show error view on the form
        console.log(message)
    )

