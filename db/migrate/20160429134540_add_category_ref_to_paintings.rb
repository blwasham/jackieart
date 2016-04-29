class AddCategoryRefToPaintings < ActiveRecord::Migration
  def change
    add_reference :paintings, :category, index: true, foreign_key: true
  end
end
