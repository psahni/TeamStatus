class EditStatusFields < ActiveRecord::Migration
  def up
    remove_column :statuses, :what_was_done_today
    remove_column :statuses, :plan_for_tomorrow
  end

  def down
    add_column :statuses, :what_was_done_today, :text
    add_column :statuses, :plan_for_tomorrow,   :text
  end
end
