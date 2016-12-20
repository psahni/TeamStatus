class AddIssueTrackerUpdated < ActiveRecord::Migration
  def change
    add_column :statuses, :tracker_updated, :boolean
  end
end
