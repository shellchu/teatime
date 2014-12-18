class CreateBeverages < ActiveRecord::Migration
  def change
    create_table :beverages do |t|
      t.integer :shop_id
      t.string :name
      t.boolean :hot
      t.boolean :cold
      t.string :size
      t.text :description
      t.integer :price
      t.timestamps null: false
    end
    add_index :beverages, :shop_id
  end
end
