class Question < ActiveRecord::Base
  attr_accessible :user, :title, :description
  belongs_to :user
  has_many :answers

  validates :title, presence: true
  validates :description, presence: true
  validates :user, presence: true
end
