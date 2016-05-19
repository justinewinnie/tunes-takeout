class AddAttsToUser < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :users, :display_name, :string
    add_column :users, :email, :string
    add_column :users, :provider, :string
    add_column :users, :photo_url, :string
  end
end
