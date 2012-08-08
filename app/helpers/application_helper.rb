module ApplicationHelper
  def manifest
    '/application.manifest' if request.path == '/'
  end
end
