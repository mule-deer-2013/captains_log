class VotesController < ApplicationController

  before_filter :load_votable

  def create
    create_vote
  end

  private

  def load_votable
    resource, id = request.path.split('/')[1, 2]
    @votable = resource.singularize.classify.constantize.find(id)
  end

  def create_vote
    if signed_in?
      vote = Vote.where(user_id: current_user.id, votable_type: @votable.class, votable_id: @votable.id)
      button = params[:vote]
      if vote.empty?
        vote = @votable.votes.new(user: current_user)
      else
        vote = vote.first
      end
      vote.change_vote(button)
      unless vote.save
        flash[:notices] = vote.errors.full_messages.join(', ')
      end
    end
    redirect_to question_path(votable)
  end

  def votable
    @votable.is_a?(Question) ? @votable : @votable.question
  end
end
