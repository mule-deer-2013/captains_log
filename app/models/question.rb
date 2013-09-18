class Question < ActiveRecord::Base
  attr_accessible :user, :title, :description
  belongs_to :user
  has_many :answers
end
