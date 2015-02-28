class AddEmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :twitter, :string
    add_column :users, :thumbnail_url, :string
  end
end
