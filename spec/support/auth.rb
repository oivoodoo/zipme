def current_user
  controller.send(:current_user)
end

def logged_in
  @user = create(:user)
  controller.send(:auto_login, @user)
end

