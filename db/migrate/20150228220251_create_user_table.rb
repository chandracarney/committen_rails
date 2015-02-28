class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :email
      t.string :twitter
      t.string :thumbnail_url, null: false

      t.timestamps null: false
    end
  end
end
