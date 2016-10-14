class Task < ActiveRecord::Base

  belongs_to :status

  TASK_TYPES = {
    "What was done today" => 2,
    "Plan for tomorrow"   => 4
  }

  #Validations

  validate  :name,
            :description,
            :task_type_id,
            :presence => true
end
