class UsersController < ApplicationController
  # include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id]) #id that comes from the url
    @questions = @user.questions
    @answers = @user.answers
  end
end
