class User < ActiveRecord::Base


  validates :email, :presence => true, :uniqueness => true

  has_many :statuses
  has_many :tasks, :through => :statuses

  # def collect_status
  #   return tasks.inject({}) do |tasks_mapping, task|
  #     tasks_mapping[task.task_type] ||= []
  #     tasks_mapping[task.task_type] << {
  #         :name => task.name,
  #         :description => task.description
  #     }
  #     tasks_mapping
  #   end
  # end
  #
  # def todays_statuses
  #   tasks.select{|task| task.task_type == Task::TASK_TYPES[:today]}
  # end
  #
  # def tomorrow_statuses
  #   tasks.select{|task| task.task_type == Task::TASK_TYPES[:tomorrow]}
  # end

end
