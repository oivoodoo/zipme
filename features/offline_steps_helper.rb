module OfflineStepsHelper
  def go_online
    page.execute_script("$(window).trigger('offline')")
  end

  def go_offline
    page.execute_script("$(window).trigger('offline')")
  end
end

World(OfflineStepsHelper)

