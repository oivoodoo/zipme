class Shortlinks.Views.Links.Form extends Backbone.View
  events:
    'submit': 'create'

  create: (event) ->
    event.preventDefault()

    @model.save(
      url: this.$el.find('input[name="link[url]"]').val(),
      success: () ->
        debugger
        # Show success notification on the form
      error: (message) ->
        debugger
        # Show error view on the form
        console.log(message)
    )

    @collection.push(@model)

