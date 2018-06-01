class AddPricingToSignupLead < ActiveRecord::Migration[5.1]
  def change
    add_column :signup_leads, :pricing_plan, :string
    add_column :signup_leads, :pricing_options, :string
  end
end
