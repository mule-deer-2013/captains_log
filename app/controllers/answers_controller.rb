class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    if signed_in?
      @answer = Answer.new(params[:answer])
      current_user.answers << @answer
      @question.answers << @answer
      flash[:error] = "Answer needs content." unless @answer.save
    end
    redirect_to @question
  end
end
