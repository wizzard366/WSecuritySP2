class Photo < ActiveRecord::Base
  attr_accessible :take_time
  attr_accessible :visitor_id
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  belongs_to :visitor
  
  def asset?
    !(asset_content_type =~ /^image.*/).nil?
  end
end
