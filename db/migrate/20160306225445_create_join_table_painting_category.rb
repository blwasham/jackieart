class CreateJoinTablePaintingCategory < ActiveRecord::Migration
  def change
    create_join_table :categories, :paintings do |t|
      t.index [:painting_id, :category_id]
      t.index [:category_id, :painting_id]
    end
  end
end
