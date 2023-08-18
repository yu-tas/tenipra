class Users::SessionsController < Devise::SessionsController
  before_action :login_user_access_restricted, only: :new

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user.id)
  end

  def guest_admin_sign_in
    user = User.guest_admin
    sign_in user
    redirect_to user_path(user.id)
  end

  def login_user_access_restricted
    if user_signed_in?
      redirect_to menus_path 
    end
  end
end
