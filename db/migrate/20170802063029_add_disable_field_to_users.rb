class AddDisableFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_disabled, :boolean, :default => true
  end
end
