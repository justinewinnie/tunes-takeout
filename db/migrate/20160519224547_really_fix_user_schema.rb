class ReallyFixUserSchema < ActiveRecord::Migration
  def change
    rename_column :users, :photo_url, :image
  end
end
