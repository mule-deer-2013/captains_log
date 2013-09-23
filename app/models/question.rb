class Question < ActiveRecord::Base
  attr_accessible :title, :description
  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable

  validates :title, :description, :user, presence: true

  def vote_tally
    self.votes.map(&:up?).count - self.votes.map(&:down?).count
  end
end
