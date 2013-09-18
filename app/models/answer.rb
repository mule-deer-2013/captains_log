class Answer < ActiveRecord::Base
  attr_accessible :user, :question, :description
  belongs_to :user
  belongs_to :question
end
