class CreateCommitTable < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.belongs_to :user, index: true
      t.string :message
      t.date :date, null: false
      t.string :url, null: false

      t.timestamps null: false
    end
  end
end
