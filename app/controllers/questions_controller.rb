class QuestionsController < ApplicationController
  before_filter :authenticate_user, :only => [:new, :create]
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build params[:question]
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end
end
