class Shortlinks.Models.Link extends Backbone.Model
  paramRoot: 'link'
  url: () ->
    if @isNew() then '/links' else "/links/#{@id}"

  secure: [
    'id', 'created_at', 'updated_at', 'short', 'user_id'
  ]

  templateJSON: () ->
    _.clone(@attributes)

  toJSON: () ->
    attributes = _.clone(@attributes)
    delete attributes[s] for s in @secure
    attributes

class Shortlinks.Collections.LinksCollection extends Backbone.Collection
  model: Shortlinks.Models.Link
  url: '/links'

