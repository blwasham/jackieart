class AddImageNameToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :image_name, :string
  end
end
