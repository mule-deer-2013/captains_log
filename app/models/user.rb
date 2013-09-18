class User < ActiveRecord::Base
  attr_accessible :name, :email
  has_many :questions
  has_many :answers
end
