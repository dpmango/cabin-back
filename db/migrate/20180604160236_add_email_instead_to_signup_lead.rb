class AddEmailInsteadToSignupLead < ActiveRecord::Migration[5.1]
  def change
    add_column :signup_leads, :email_instead, :boolean, default: false
  end
end
