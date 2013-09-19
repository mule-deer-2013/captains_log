class Vote < ActiveRecord::Base
  attr_accessible :up_down, :votable_id, :votable_type, :user_id
end