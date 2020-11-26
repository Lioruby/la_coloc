module NavigationHelper
  def nav_active_class_for(resource, action)
    'text-yellow-400' if params[:controller] == resource.downcase && params[:action] == action.downcase

  end
end
