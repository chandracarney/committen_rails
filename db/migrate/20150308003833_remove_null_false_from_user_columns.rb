class RemoveNullFalseFromUserColumns < ActiveRecord::Migration
  def change
    change_column_null(:users, :name, true)
    change_column_null(:users, :provider, true)
  end
end
