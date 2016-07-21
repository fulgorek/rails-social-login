module ApplicationHelper
  def active_class(*path)
    in_path?(*path) ? 'active' : ''
  end

  def in_path?(*routes)
    routes.select { |item| item == request.fullpath }.length > 0
  end
end
