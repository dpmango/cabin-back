class AddFieldsToOnboardings < ActiveRecord::Migration[5.1]
  def change
    add_column :onboardings, :a_shortname, :string
    add_column :onboardings, :a_companycode, :string
    add_column :onboardings, :a_corpsecretary, :string
    add_column :onboardings, :a_accounting, :string
    add_column :onboardings, :a_corpsecretary_name, :string
    add_column :onboardings, :a_corpsecretary_id, :string
    add_column :onboardings, :a_status, :integer
    add_column :onboardings, :a_action, :string
    add_column :onboardings, :a_notes, :text
    add_column :onboardings, :a_companyaddress1, :string
    add_column :onboardings, :a_companyaddress2, :string
    add_column :onboardings, :a_companypostal, :string
    add_column :onboardings, :a_acra_address, :string
    add_column :onboardings, :a_acra_incorporationdate, :string
  end
end
