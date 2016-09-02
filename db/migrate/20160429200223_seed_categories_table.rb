class SeedCategoriesTable < ActiveRecord::Migration
  def up
    Category.find_or_create_by(name: "Oil")
    Category.find_or_create_by(name: "Pastel")
  end
 
  def down
    Category.delete_all
  end
end
