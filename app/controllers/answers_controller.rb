class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:id])
    if signed_in?
      @answer = Answer.new(params[:answer])
      @answer.user = current_user
      @answer.question = @question
      @answer.save
    end
    redirect_to("/questions/#{@question.id}")
  end
end
