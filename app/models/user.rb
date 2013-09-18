require 'bcrypt'

class User < ActiveRecord::Base

  attr_accessible :name, :email
  has_many :questions
  has_many :answers

  include BCrypt

  def password
      @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
