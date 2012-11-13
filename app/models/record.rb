class Record < ActiveRecord::Base
  attr_accessible :entrance, :exit, :note, :plate_number, :residential_id, :user_id, :visitor_id
  belongs_to :user 
  belongs_to :residential 
  belongs_to :visitor 
  
end
