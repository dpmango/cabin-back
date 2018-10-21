class AddFieldsToStakeholder < ActiveRecord::Migration[5.1]
  def change
    add_column :stakeholders, :upload_id, :text
    add_column :stakeholders, :upload_passport, :text
    add_column :stakeholders, :upload_address, :text
    add_column :stakeholders, :relation, :string
    add_column :stakeholders, :isDirector, :boolean, :default => false
    add_column :stakeholders, :isShareholder, :boolean, :default => false
    add_column :stakeholders, :nomineeDirector, :string
    add_column :stakeholders, :agent, :string
    add_column :stakeholders, :grounds, :string
    add_column :stakeholders, :shareholderOnBehalf, :string
    add_column :stakeholders, :offence, :string
    add_column :stakeholders, :bankrupt, :string
    add_column :stakeholders, :pep, :string
    add_column :stakeholders, :designation, :string
  end
end
