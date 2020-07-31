module UsersHelper
  def signed_in_edit(user)
    link_to 'Edit', edit_user_path(user) if user == logged_user
  end

  def signed_in_logout(user)
    link_to 'Logout', logout_path, method: :post if user == logged_user
  end
end
