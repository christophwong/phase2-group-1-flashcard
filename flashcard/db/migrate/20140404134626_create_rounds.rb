class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :user_id
      t.integer :deck_id
      t.boolean :complete, default: false
      t.timestamps
    end
  end
end
