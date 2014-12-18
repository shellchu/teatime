class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :beverage_id
      t.integer :event_id
      t.string :ice
      t.string :sugar
      t.boolean :hot
      t.timestamps null: false
    end
    add_index :orders, :user_id
    add_index :orders, :beverage_id
    add_index :orders, :event_id
  end
end
