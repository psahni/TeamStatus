class CreateRiskDocuments < ActiveRecord::Migration
  def change
    create_table :risk_documents do |t|
      t.string :feature_id
      t.string :feature_link
      t.string :feature_name
      t.string :status
      t.integer :iteration
      t.boolean :prd
      t.boolean :ux
      t.text :notes

      t.timestamps null: false
    end
  end
end
