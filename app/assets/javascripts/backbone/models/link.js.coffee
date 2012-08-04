class Shortlinks.Models.Link extends Backbone.Model
  paramRoot: 'link'
  url: () ->
    if @isNew() then '/links' else "/links/#{@id}"

class Shortlinks.Collections.LinksCollection extends Backbone.Collection
  model: Shortlinks.Models.Link
  url: '/links'

