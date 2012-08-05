class Shortlinks.Views.Offline extends Backbone.View
  online: navigator.onLine

  initialize: () ->
    $(window).bind('offline', () => @changeState())
    $(window).bind('online', () => @changeState())

  changeState: () ->
    @online = if @online then false else true
    @render()

  render: () ->
    if @online
      @.$el.hide()
    else
      @.$el.show()

