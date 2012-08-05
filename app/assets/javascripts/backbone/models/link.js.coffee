class Shortlinks.Models.Link extends Backbone.Model
  paramRoot: 'link'
  defaults:
    key: 'offline'
    short: '/offline'

  url: () ->
    if @isNew() then '/links' else "/links/#{@id}"

  secure: [
    'id', 'created_at', 'updated_at', 'short', 'user_id', 'collection', 'dirty', 'sid'
  ]

  templateJSON: () ->
    _.clone(@attributes)

  toJSON: () ->
    attributes = _.clone(@attributes)
    delete attributes[s] for s in @secure
    attributes

  initialize: () ->
    @.on('change:dirty', (model, dirty) => @changeDirty(model, dirty))

    unless Offline.onLine()
      $(window).bind('online', () => @syncItem())

  syncItem: () ->
    @collection.storage.sync.pushItem(@) if @get('dirty')

  changeDirty: (model, dirty) ->
    model.trigger('update', @) unless dirty

class Shortlinks.Collections.LinksCollection extends Backbone.Collection
  model: Shortlinks.Models.Link
  url: '/links'

  initialize: () ->
    @storage = new Offline.Storage('links', @, autoPush: true)


