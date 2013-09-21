class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    p @question.votes
    @question_vote_total = @question.votes.where(up: true).count - @question.votes.where(down: true).count
    p @question_vote_total
    @answers = @question.answers
    @answer_vote_count = []
    @answers.each do |answer|
      vote_score = 0
      answer.votes.each do |vote|
        if vote.up && !vote.down
          vote_score += 1
        elsif !vote.up && vote.down
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
