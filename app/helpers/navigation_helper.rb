module NavigationHelper
  def nav_active_class_for(resource)
    'text-yellow-400' if params[:controller] == resource.downcase
  end
end
