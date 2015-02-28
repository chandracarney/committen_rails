class CreateGoals < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :name, null: false
      t.string :provider, null: false
      t.string :uid, null: false

      t.timestamps null: false
    end

    create_table :goals do |t|
      t.belongs_to :user, index:true
      t.string :title, null: false
      t.string :description, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :daily_quantity, default: 1
      t.boolean :completed, default: false

      t.timestamps null: false
    end

    create_table :commits do |t|
      t.belongs_to :user, index:true
      t.string :message
      t.date :date, null: false
      t.string :url, null: false

      t.timestamps null: false
    end
  end
end
