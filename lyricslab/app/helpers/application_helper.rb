module ApplicationHelper
def flash_class(level)
    case level
    when :notice then "info"
    when :error then "error"
    when :alert then "warning"
    end
  end
  
  
  def admin_menus
    Role.admin_menus
  end
  def user_menus(user)
    User.menus
  end

end
