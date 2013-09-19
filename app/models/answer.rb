class Answer < ActiveRecord::Base
  attr_accessible :user, :question, :description
  belongs_to :user
  belongs_to :question

  validates :description, :user, :question, presence: true
end
