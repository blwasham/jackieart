class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false, limit: 155
      t.string :description, limit: 255

      t.timestamps null: false
    end
  end
end
