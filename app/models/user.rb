class User < ActiveRecord::Base

  attr_accessible :name, :email, :password
  has_many :questions
  has_many :answers
  has_many :votes

  has_secure_password

  validates :name, :email, :password, presence: true
  validates :email, format: /\w+@\w+\.\w+/
  validates :email, uniqueness: true

  before_save :create_remember_token

  private

  def create_remember_token
  	self.remember_token = SecureRandom.urlsafe_base64
  end

end
