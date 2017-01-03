class EmailNotification

  attr_accessor :email
  include ActiveModel
  include ActiveModel::Validations

  validates :email,
            :presence => true


  validates :email,
            format: { with: /[^@\s]+@([a-z]+)\.(?:([a-z0-9]+))/ }

  def initialize(email)
    @email = email
  end

end
