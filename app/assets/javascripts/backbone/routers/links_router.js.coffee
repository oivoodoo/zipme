class Shortlinks.Routers.LinksRouter extends Backbone.Router
  routes:
    '': 'index'

  index: () ->
    @view = new Shortlinks.Views.Links.List(
      el: $('#links')
      collection: Shortlinks.Tables.links
    )
    @view.render();

    @form = new Shortlinks.Views.Links.Form(
      el: $('#new_link')
      model: new Shortlinks.Models.Link
      collection: Shortlinks.Tables.links
    )
    @form.render()

