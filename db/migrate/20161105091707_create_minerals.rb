class CreateMinerals < ActiveRecord::Migration[5.0]
  def change
    create_table :minerals do |t|
      t.integer :minerals_cart_id
      t.integer :rubies_inside_mineral
      t.string :title, default: ""

      t.timestamps
    end
  end
end
