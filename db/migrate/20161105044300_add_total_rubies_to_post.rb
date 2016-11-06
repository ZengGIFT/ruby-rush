class AddTotalRubiesToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :total_rubies, :integer, default: 0
  end
end
