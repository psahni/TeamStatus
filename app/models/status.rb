class Status < ActiveRecord::Base
  belongs_to :user
  #delegate :email, :to => :user, :prefix => 'user'

  validates :user_email,
            :presence => true

  attr_accessor  :user_email

  #
  # Associations
  #
  has_many :tasks
  has_many :today_tasks, -> { where('tasks.task_type = ?', Task::TASK_TYPES[:today]) },
           :class_name => 'Task'
  has_many :tomorrow_tasks, -> { where('tasks.task_type = ?', Task::TASK_TYPES[:tomorrow]) },
           :class_name => 'Task'

  #---------------------------------------------------------------------------------------------------------------------

  accepts_nested_attributes_for :tasks,
                                :allow_destroy => true,
                                :reject_if => :all_blank


  accepts_nested_attributes_for :today_tasks,
                                :allow_destroy => true,
                                :reject_if => :all_blank

  accepts_nested_attributes_for :tomorrow_tasks,
                                :allow_destroy => true,
                                :reject_if => :all_blank

  #---------------------------------------------------------------------------------------------------------------------

  #
  # Validations
  #
  validate :email_of_associated_user, :if => lambda {|status| status.new_record?}

  #
  # Callbacks
  #
  before_create :associate_user

  def user_email
    user.try(:email) || @user_email
  end

  def email_of_associated_user
    @user = User.where(email: user_email).first
    self.errors.add(:user_email, "No associated user found in the database with provided email") if @user.blank?
  end


  def associate_user
    if @user
      self.user_id = @user.id
    end
  end

end
