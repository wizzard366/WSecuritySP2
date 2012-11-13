class ResidentialType < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :residentials
end
