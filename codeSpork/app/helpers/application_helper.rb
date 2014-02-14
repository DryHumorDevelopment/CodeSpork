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

  def format_date(date)
    if date == Time.now.to_date.to_s
      return "Today at: " + date.to_time
    end
  end
end
