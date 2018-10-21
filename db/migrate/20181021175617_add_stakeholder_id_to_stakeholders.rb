class AddStakeholderIdToStakeholders < ActiveRecord::Migration[5.1]
  def change
    add_column :stakeholders, :stakeholder_id, :string
  end
end
