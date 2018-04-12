class RiskDocument < ActiveRecord::Base

# Validations
#----------------------------------------------------------------------------
  validates :feature_id,   :presence => true
  validates :feature_name, :presence => true
  validates :iteration,:presence => true
  validates :iteration, numericality: { only_integer: true }
  validates :status, :presence => true
#----------------------------------------------------------------------------


end
