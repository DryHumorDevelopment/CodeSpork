module ApplicationHelper
  def is_admin?
    if user_signed_in? && current_user.admin?
      return true
    else
      return false
    end
  end
  def truncate_html(html)
    text = html.gsub(/\<.+\>/, '')
    return truncate(text.to_s, :length => 15)
  end
end
