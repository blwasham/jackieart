class RenameCateoriesPaintingsTable < ActiveRecord::Migration
  def change
    rename_table :categories_paintings, :paintings_categories
  end
end
