class Shortlinks.Routers.LinksRouter extends Backbone.Router
  routes:
    '':               'index'
    'links/:id/edit': 'edit'

  index: () ->
    @view = new Shortlinks.Views.Links.List(
      el: $('#links')
      collection: Shortlinks.Tables.links
    )
    @view.render();

    @form = new Shortlinks.Views.Links.Form(
      el: $('#new_link')
      collection: Shortlinks.Tables.links
    )
    @form.render()

  edit: (id) ->
    model = new Shortlinks.Models.Link(id: id)
    model.fetch
      success: (model) =>
        @view = new Shortlinks.Views.Links.Edit(model: model)
        @view.render()
      error: (message) ->
        console.log(message)

