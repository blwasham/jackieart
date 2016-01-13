class AddDefaultValueToFeatured < ActiveRecord::Migration
  def up
    change_column :paintings, :featured, :boolean, :default => false
  end

  def down
    change_column :paintings, :featured, :boolean, :default => nil
  end
end
