class Shortlinks.Models.Link extends Backbone.Model
  paramRoot: 'link'
  defaults:
    key: 'offline'
    short: '/offline'
    clicks: 0

  url: () ->
    if @isNew() then '/links' else "/links/#{@id}"

  secure: [
    'id', 'created_at', 'updated_at', 'short', 'user_id', 'collection',
    'dirty', 'sid', 'access', 'clicks'
  ]

  templateJSON: () ->
    _.clone(@attributes)

  toJSON: () ->
    attributes = _.clone(@attributes)
    delete attributes[s] for s in @secure
    attributes

  initialize: () ->
    @changeAccess()

    @set(sid: @id)
    @.on('change:dirty', (model, dirty) => @changeDirty(model, dirty))

  changeAccess: () ->
    access = @get('user_id') == config.user_id or not @get('user_id')?
    @set(access: access)

  changeDirty: (model, dirty) ->
    @changeAccess()
    model.trigger('update', @) unless dirty

class Shortlinks.Collections.LinksCollection extends Backbone.Collection
  model: Shortlinks.Models.Link
  url: '/links'

  initialize: () ->
    @storage = new Offline.Storage('links', @, autoPush: true)
    $(window).bind('online', () =>
      window.setTimeout(() =>
        @storage.sync.push()
      6000)
    )

