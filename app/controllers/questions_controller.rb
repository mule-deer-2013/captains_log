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
    @question = Question.new(params[:question])
    if @question.save
      redirect_to("/questions/#{@question.id}")
    else
      render 'new'
    end
  end
end
