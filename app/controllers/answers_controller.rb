class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:id])
    if signed_in?
      @answer = Answer.new(params[:answer])
      current_user.answers << @answer
      @question.answers << @answer
      flash[:error] = "Answer needs content." unless @answer.save
    end
    redirect_to("/questions/#{@question.id}")
  end
end
