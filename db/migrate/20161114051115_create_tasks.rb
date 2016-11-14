class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text     :name
      t.text     :description
      t.integer  :task_type
      t.integer  :status_id
      t.boolean  :done
      t.boolean  :task_updated
      t.timestamps null: false
    end
  end
end
