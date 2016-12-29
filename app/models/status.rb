class Status < ActiveRecord::Base
  belongs_to :user
  #delegate :email, :to => :user, :prefix => 'user'

  validates :user_email,
            :presence => true

  attr_accessor  :user_email

  #
  # Associations
  #
  has_many :tasks,
           :dependent => :destroy

  has_many :today_tasks, -> { where('tasks.task_type = ?', Task::TASK_TYPES[:today]) },
           :class_name => 'Task',
           :dependent => :destroy

  has_many :tomorrow_tasks, -> { where('tasks.task_type = ?', Task::TASK_TYPES[:tomorrow]) },
           :class_name => 'Task',
           :dependent => :destroy

  #---------------------------------------------------------------------------------------------------------------------

  accepts_nested_attributes_for :tasks,
                                :allow_destroy => true

  accepts_nested_attributes_for :today_tasks,
                                :allow_destroy => true

  accepts_nested_attributes_for :tomorrow_tasks,
                                :allow_destroy => true

  #---------------------------------------------------------------------------------------------------------------------

  #
  # Validations
  #
  validate :email_of_associated_user, :if => lambda {|status| status.new_record?}
  validate :status_already_added_for_today, :if => lambda {|status| status.new_record?}
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

  def status_already_added_for_today
    user_emails = Status.where("Date(created_at) = ? and user_id IS NOT NULL", Date.today).collect{|status| status.user.email}
    if user_emails.include?(user_email)
      self.errors.add(:user_email, "Status with this user has already been created")
    end
  end


  def associate_user
    if @user
      self.user_id = @user.id
    end
  end

  def self.fetch_today_statuses
    ans = Status.includes(:user, :today_tasks, :tomorrow_tasks).where("Date(statuses.created_at) = ?", Date.today).inject({}){|today_statuses, status|
      today_statuses[status.user] = status
      today_statuses
    }
    return Hash[ans.sort_by{|k,v| k.sorder}]
  end

  def self.fetch_prev_day_statuses(diff=1)
    return Status.includes(:user, :today_tasks, :tomorrow_tasks).where("Date(statuses.created_at) = ?", Date.today - diff).inject({}){|today_statuses, status|
      today_statuses[status.user] = status
      today_statuses
    }
  end

end
