class Visitor < ActiveRecord::Base
  attr_accessible :id_number, :name, :note, :visitor_status_id
  belongs_to :visitor_status
  has_one :photo
  has_many :records
  has_many :users, :through => :records
  has_many :user_banned_lists
  has_many :residential_banned_lists;
  has_many :residentials, :through => :records
  has_many :banned_by_users, :through => :user_banned_lists, :source => :user
  has_many :banned_by_residentials, :through => :residential_banned_lists, :source => :residential
end
