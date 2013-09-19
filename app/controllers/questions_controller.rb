class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def new
    if signed_in?
      puts "You're in"
      render :new
    else
      puts "You're out"
      redirect_to('/')
    end
  end

  def create
    @user = current_user
    @question = Question.new(params[:question])
    @question.user = @user
    @question.save
    redirect_to("/questions/#{@question.id}")
  end
end
