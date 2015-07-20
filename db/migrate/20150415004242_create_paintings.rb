class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.string :name
      t.string :description
      t.integer :position
      t.integer :price_cents
      t.timestamps
    end
  end
end
