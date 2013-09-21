class VotesController < ApplicationController
  # include VotesHelper

  before_filter :load_votable

  def create
    create_vote
    # puts user_path(1)
  end

  private

  def load_votable
    resource, id = request.path.split('/')[1, 2]
    @votable = resource.singularize.classify.constantize.find(id)
  end

  def create_vote
    vote = Vote.where(user_id: current_user.id, votable_type: @votable.class, votable_id: @votable.id)
    button = params[:vote] # either {up: true} or {down: true}
    if vote.empty?
      vote = @votable.votes.new(user: current_user)
    else
      vote = vote.first
    end
    vote.change_vote(button)
    unless vote.save
      flash[:notices] = vote.errors.full_messages.join(', ')
    end
    redirect_to question_path(votable)
    # redirect_to root_path
  end

  # def votable_path(votable_obj)
  #   if votable_obj.is_a? Question
  #     "/questions/#{votable_obj.id}/"
  #   else
  #     "/questions/#{votable_obj.question.id}/"
  #   end
  # end

  def votable
    @votable.is_a?(Question) ? @votable : @votable.question
  end
end



# vote = Vote.new(params[:vote])
#     puts "PARAMS: #{params[:vote]}"
#     @votable.votes << vote
#     current_user.votes << vote
#     question = answer.question
#     unless vote.save
#       flash[:notices] = "your vote was unable to save"
#     end
#     redirect_to "/questions/#{question.id}"
