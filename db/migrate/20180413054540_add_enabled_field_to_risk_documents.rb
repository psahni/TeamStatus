class AddEnabledFieldToRiskDocuments < ActiveRecord::Migration
  def change
    add_column :risk_documents, :enabled, :boolean, :default => true
  end
end
