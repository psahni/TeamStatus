class Status < ActiveRecord::Base
  belongs_to :user
  #delegate :email, :to => :user, :prefix => 'user'

  validates :user_email,
            :presence => true

  attr_accessor  :user_email

  has_many :tasks

  validate :email_of_associated_user

  before_create :associate_user

  def user_email
    user.try(:email) || @user_email
  end

  def email_of_associated_user
    @user = User.where(email: @user_email).first
    self.errors.add(:user_email, "No associated user found in the database with provided email") if @user.blank?
  end


  def associate_user
    if @user
      self.user_id = @user.id
    end
  end

end
