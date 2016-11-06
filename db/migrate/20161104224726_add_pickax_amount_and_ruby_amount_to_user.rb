class AddPickaxAmountAndRubyAmountToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pickax_amount, :integer, default: 10
    add_column :users, :ruby_amount, :integer, default: 10    
  end
end
