module UsersHelper
  def unread_count
    if current_user.notifications.unread.count <= 0
      ""
    else
      current_user.notifications.unread.count
    end
  end
end
