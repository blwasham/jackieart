class Painting < ActiveRecord::Base
  
  acts_as_list
  
  monetize :price_cents, allow_nil: true,
    numericality: {
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 10000
    }
    
  attr_accessible :description, :name, :price, :position, :image_name, :featured
  validates :name, :image_name, presence: true, uniqueness: true
  #validates :position, :numericality => { :greater_than_or_equal_to => 0 }
end
