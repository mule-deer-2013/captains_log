class Vote < ActiveRecord::Base
  attr_accessible :up_down, :votable_id, :votable_type, :user_id
  
  belongs_to :votable, polymorphic: true
  belongs_to :user

  validates :user_id, presence: true
  validates :up_down, :votable_id, :votable_type, presence: true

end
