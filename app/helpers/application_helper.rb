module ApplicationHelper
  def nav_class_for_controller(*controller)
    is_active = controller.include?(params[:controller])
    is_active ? "active" : ""
  end
end
