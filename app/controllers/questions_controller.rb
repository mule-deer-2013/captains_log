class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @vote = Vote.new
    @answer_vote_count = []
    @answers.each do |answer|
      vote_score = 0
      answer.votes.each do |vote|
        if vote.up_down
          vote_score += 1
        else
          vote_score -= 1
        end
      end
      @answer_vote_count << vote_score
    end
  end

  def new
    if signed_in?
      puts "You're in"
      @question = Question.new
      render :new
    else
      puts "You're out"
      flash[:notices] = "Must login to create question"
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
