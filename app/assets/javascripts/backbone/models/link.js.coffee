class Shortlinks.Models.Link extends Backbone.Model
  paramRoot: 'link'
  url: () ->
    if @isNew() then '/links' else "/links/#{@id}"

  secure_attributes: [
    'id', 'created_at', 'updated_at', 'short', 'user_id'
  ]

  toJSON: () ->
    attributes = _.clone(@attributes)
    delete attributes[sa] for sa in @secure_attributes
    _.clone(attributes)

class Shortlinks.Collections.LinksCollection extends Backbone.Collection
  model: Shortlinks.Models.Link
  url: '/links'

