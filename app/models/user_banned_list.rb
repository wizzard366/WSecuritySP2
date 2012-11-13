class UserBannedList < ActiveRecord::Base
  attr_accessible :user_id, :visitor_id
  belongs_to :visitor
  belongs_to :user
end
