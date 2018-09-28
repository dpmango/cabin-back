class AddIsProductionToSignupLead < ActiveRecord::Migration[5.1]
  def change
    add_column :signup_leads, :isproduction, :boolean, default: false
  end
end
