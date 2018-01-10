module UsersHelper
  def is_user?
    if user_signed_in? && current_user.user?
      return true
    else
      return false
    end
  end

  def is_admin?
    if user_signed_in? && current_user.admin?
      return true
    else
      return false
    end
  end

  def is_appraiser?
    if user_signed_in? && current_user.appraiser?
      return true
    else
      return false
    end
  end

end
