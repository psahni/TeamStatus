class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :what_was_done_today
      t.text :plan_for_tomorrow
      t.integer :user_id
      t.text :impediments
      t.boolean :done
      t.timestamps null: false
    end
  end
end
