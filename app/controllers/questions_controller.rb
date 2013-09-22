class QuestionsController < ApplicationController
  def index
    @user = User.new
    @questions= Question.all
  end

  def show
    @question = Question.find(params[:id])
    @question_vote_total = vote_tally(@question)
    @answers = @question.answers
    @answer_vote_count = []
    @answers.each do |answer|
      @answer_vote_count << vote_tally(answer)
    end
  end

  def new
    if signed_in?
      @question = Question.new
      render :new
    else
      flash[:notices] = "Must login to create question"
      redirect_to root_path
    end
  end

  def create
    params[:question][:user] = current_user
    @question = Question.new(params[:question])
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end
end
