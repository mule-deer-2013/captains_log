class UsersController < ApplicationController
  #include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to "/"
    else
      render "new"
    end
  end
end
