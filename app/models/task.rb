class Task < ActiveRecord::Base

  TASK_TYPES = {
    :today => 1,
    :tomorrow => 2
  }

  validates :name,
            :description,
            :presence => true
end
