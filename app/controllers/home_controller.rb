class HomeController < ApplicationController
  def index
    puts flash[:notices]
    @notices = flash[:notices]
    @questions = Question.all
  end
end
