class DropPaintingsCategories < ActiveRecord::Migration
  def change
    drop_table :paintings_categories
  end
end
