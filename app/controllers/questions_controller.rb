class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def new
    if signed_in?
      puts "You're in"
      @question = Question.new
      render :new
    else
      puts "You're out"
      redirect_to('/')
    end
  end

  def create
    params[:question][:user] = current_user
    @question = Question.create(params[:question])
    redirect_to("/questions/#{@question.id}")
  end
end
