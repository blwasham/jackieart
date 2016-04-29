class PaintingCategory < ActiveRecord::Base
  belongs_to :paintings
  belongs_to :categories
end
