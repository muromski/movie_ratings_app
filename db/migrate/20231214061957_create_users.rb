class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :about, null: false
      t.string :avatar_url, null: false


      t.timestamps
    end
  end
end
