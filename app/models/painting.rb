class Painting < ActiveRecord::Base
  belongs_to :category

  acts_as_list
  
  monetize :price_cents, allow_nil: true,
    numericality: {
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 10000
    }
  default_scope { order('position ASC') }
  scope :gallery_listing, -> { where.not(image_name: nil) } 
  scope :featured, -> { where(featured: true) }
  
  validates :name, :image_name, presence: true, uniqueness: true
  validates :featured, :inclusion => {:in => [true, false]}
end
