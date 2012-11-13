class VisitorStatus < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :visitors
end
