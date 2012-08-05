class Shortlinks.Routers.LinksRouter extends Backbone.Router
  routes:
    '':               'index'
    'links/:id/edit': 'edit'

  index: () ->
    @offline = new Shortlinks.Views.Offline(el: $('#offline-status'))
    @offline.render()

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
    model = Shortlinks.Tables.links.get(id: id)

    el = $("#link_#{model.id}")

    @view = new Shortlinks.Views.Links.Edit(
      model: model
      el: el
    )
    @view.render()

