class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :phone
      t.timestamps null: false
    end
  end
end
