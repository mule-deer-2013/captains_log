class VotesController < ApplicationController

  def create
    vote = Vote.new(params[:vote])
    answer = Answer.find(params[:answer_id])
    answer.votes << vote
    current_user.votes << vote
    question = answer.question
    unless vote.save
      flash[:notices] = "your vote was unable to save"
    end
    redirect_to "/questions/#{question.id}"
  end
end
