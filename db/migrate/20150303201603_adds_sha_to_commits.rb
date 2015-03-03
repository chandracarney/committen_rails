class AddsShaToCommits < ActiveRecord::Migration
  def change
    add_column :commits, :sha, :string, null: false
  end
end
