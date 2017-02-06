class User < ActiveRecord::Base


  validates :email, :presence => true, :uniqueness => true

  has_many :statuses
  has_many :tasks, :through => :statuses


  def self.find_who_have_not_updated_status
    users_with_status.select{|user| user.status_id.blank?}
  end

  def self.users_with_status
    User.joins("LEFT OUTER JOIN statuses ON users.id = statuses.user_id AND Date(statuses.created_at) = '#{ Date.today.strftime('%Y-%m-%d') }'")
    .select("users.id, users.name, statuses.id as status_id")
  end


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
