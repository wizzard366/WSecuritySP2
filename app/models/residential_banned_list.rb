class ResidentialBannedList < ActiveRecord::Base
  attr_accessible :residential_id, :visitor_id
  belongs_to :residential
  belongs_to :visitor
end
