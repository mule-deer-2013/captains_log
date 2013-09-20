class Answer < ActiveRecord::Base
  attr_accessible :user_id, :question_id, :description
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable

  validates :description, :user, :question, presence: true
end
