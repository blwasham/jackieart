class Painting < ActiveRecord::Base
  acts_as_list
  
  monetize :price_cents, allow_nil: true,
    numericality: {
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 10000
    }
    
  validates :name, :image_name, presence: true, uniqueness: true
end
