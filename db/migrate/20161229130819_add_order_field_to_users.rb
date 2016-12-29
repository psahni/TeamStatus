class AddOrderFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sorder, :integer
  end
end
