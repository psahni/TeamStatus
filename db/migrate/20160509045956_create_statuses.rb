class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :what_was_done_today
      t.text :plan_for_tomorrow

      t.timestamps null: false
    end
  end
end
