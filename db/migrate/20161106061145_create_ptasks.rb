class CreatePtasks < ActiveRecord::Migration[5.0]
  def change
    create_table :ptasks do |t|
      t.string :title
      t.text :description
      t.integer :reward
      t.boolean :is_hidden, default: true
      t.timestamps
    end
  end
end
