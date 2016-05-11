class Status < ActiveRecord::Base
  belongs_to :user
  #delegate :email, :to => :user, :prefix => 'user'

  validates :user_email,
            :what_was_done_today,
            :plan_for_tomorrow,
            :presence => true

  attr_accessor  :user_email

  validate :email_associated_user

  before_create :associate_user

  def user_email
    user.try(:email) || @user_email
  end

  def email_associated_user
    @user = User.where(email: @user_email).first
    self.errors.add(:user_email, "No associated user found in the database with provided email") if @user.blank?
  end


  def associate_user    
    if @user
      self.user_id = @user.id
    end
  end

end
