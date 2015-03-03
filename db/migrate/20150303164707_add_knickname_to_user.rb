class AddKnicknameToUser < ActiveRecord::Migration
  def change
    add_column :users, :knickname, :string
  end
end
