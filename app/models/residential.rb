class Residential < ActiveRecord::Base
  attr_accessible :description, :name, :note, :residential_address, :residential_status_id, :residential_type_id
  belongs_to :residential_status
  belongs_to :residential_type
  has_many :users
  has_many :residential_banned_lists
  has_many :visitors_records, :through => :records, :source => :visitor
  has_many :banned_visitors, :through => :residential_banned_lists, :source => :visitor
  has_many :records
  
end
