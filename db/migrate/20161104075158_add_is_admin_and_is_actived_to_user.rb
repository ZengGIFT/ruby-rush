class AddIsAdminAndIsActivedToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :is_actived, :boolean, default: false
  end
end
