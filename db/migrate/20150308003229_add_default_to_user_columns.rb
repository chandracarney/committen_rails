class AddDefaultToUserColumns < ActiveRecord::Migration
  def change
    change_column_default(:users, :name, "")
    change_column_default(:users, :provider, "github")
    change_column_default(:users, :email, "")
    change_column_default(:users, :twitter, "")
  end
end
