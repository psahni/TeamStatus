class EmailNotification

  attr_accessor :email
  include ActiveModel
  include ActiveModel::Validations

  validates :email,
            :presence => true


  validates :email,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  def initialize(email)
    @email = email
  end

end
