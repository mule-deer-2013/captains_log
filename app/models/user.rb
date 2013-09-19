

class User < ActiveRecord::Base

  attr_accessible :name, :email, :password
  has_many :questions
  has_many :answers

  has_secure_password

  validates :name, :email, :password, presence: true
  validates :email, format: /\w+@\w+\.\w+/
  validates :email, uniqueness: true

end
