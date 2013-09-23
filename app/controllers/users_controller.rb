class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to @user
    else
      flash[:notice] = @user.errors.full_messages.join(". ")
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
    # REVIEW: my strong opinion, these variables are not needed. use @user.questions in the view.
    @questions = @user.questions
    @answers = @user.answers
  end
end
