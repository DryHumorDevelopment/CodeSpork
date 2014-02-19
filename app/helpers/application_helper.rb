module ApplicationHelper
  def is_admin?
    if user_signed_in? && current_user.admin?
      return true
    else
      return false
    end
  end
  def find_user(users, id)
    return users.detect {|user| user.id == id }
  end
  def cp(path)
    "current" if current_page?(path)
  end
end
