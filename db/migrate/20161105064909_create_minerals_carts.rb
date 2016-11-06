class CreateMineralsCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :minerals_carts do |t|
      t.integer :user_id
      t.integer :rubies_incart, default: 0
      t.string :aasm_state, default: "new_cart"
      t.index :aasm_state
      t.text :comment
      t.timestamps
    end
  end
end
