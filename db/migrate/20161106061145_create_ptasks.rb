class CreatePtasks < ActiveRecord::Migration[5.0]
  def change
    create_table :ptasks do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.boolean :is_actived, default: false
      t.timestamps
    end
  end
end
