class HomeController < ApplicationController
  def index
    puts flash[:notices] # REVIEW: please dont commit debugging code.
    @notices = flash[:notices] # REVIEW: you have access to flash in the views, no need for the variable.
    @questions = Question.all
  end
end
