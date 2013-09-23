class AnswersController < ApplicationController
  # REVIEW: user authenticate_user
  def create
    @question = Question.find(params[:question_id])
    @answer = current_user.answers.build params[:answer]
    @answer.question = @question
    if @answer.save
      # happy path
    else
      # unhappy path
    end
  end
end
