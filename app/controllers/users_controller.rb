class UsersController < ActionController::Base
  def sign_up
    @user = User.new
  end
end
