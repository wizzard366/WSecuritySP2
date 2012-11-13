class BannedName < ActiveRecord::Base
  attr_accessible :id_doc, :name, :user_id
  belongs_to :user
end
