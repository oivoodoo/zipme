class Shortlinks.Models.Link extends Backbone.Model
  paramRoot: 'link'
  url: '/links'

class Shortlinks.Collections.LinksCollection extends Backbone.Collection
  model: Shortlinks.Models.Link
  url: '/links'

