class User < ActiveRecord::Base

  cattr_accessor :users
  @@users = {
        'Adwitiya' => 'adwitiya.prabhakar@globallogic.com',
        'Danish' => 'danish.arora@globallogic.com',
        'Diljohn' => 'diljohn.singh@globallogic.com',
        'Pankaj' => 'pankaj.upadhyay@globallogic.com',
        'Prashant Goel' => 'prashant.goel@globallogic.com',
        'Prashant Sahni' => 'prashantkumar.sahni@globallogic.com',
        'Madhuri' => 'madhuri.rawat@globallogic.com',
        'Rani' => 'rani.agrawal@globallogic.com',
        'Priyanka' => 'priyanka.dudeja1@globallogic.com'
    }

    validates :email, :presence => true, :uniqueness => true

  has_many :statuses
  has_many :tasks, :through => :statuses

  def collect_status
    return tasks.inject({}) do |tasks_mapping, task|
      tasks_mapping[task.task_type] ||= []
      tasks_mapping[task.task_type] << {
          :name => task.name,
          :description => task.description
      }
      tasks_mapping
    end
  end

  def todays_status
    tasks.select{|task| task.task_type == Task::TASK_TYPES[:today]}
  end

  def tomorrow_status
    tasks.select{|task| task.task_type == Task::TASK_TYPES[:tomorrow]}
  end

end
