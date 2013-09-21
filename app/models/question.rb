class Question < ActiveRecord::Base
  attr_accessible :user, :title, :description
  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable

  validates :title, presence: true
  validates :description, presence: true
  validates :user, presence: true
end
