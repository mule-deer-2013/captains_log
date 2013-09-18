class UsersController < ActionController::Base
  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to "/"
    else
      render "sign_up"
    end
  end
end
