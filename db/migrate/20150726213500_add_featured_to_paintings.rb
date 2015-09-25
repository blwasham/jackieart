class AddFeaturedToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :featured, :boolean
  end
end
