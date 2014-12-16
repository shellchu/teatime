class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :owner_id
      t.integer :shop_id
      t.datetime :end_time
      t.timestamps null: false
    end
    add_index :events, :owner_id
    add_index :events, :shop_id
  end
end
