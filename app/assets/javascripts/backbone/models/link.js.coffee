class Shortlinks.Models.Link extends Backbone.Model
  paramRoot: 'link'

class Shortlinks.Collections.LinksCollection extends Backbone.Collection
  model: Shortlinks.Models.Link
  url: '/links'

