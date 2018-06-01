class AddIsFollowUpToSignupLead < ActiveRecord::Migration[5.1]
  def change
    add_column :signup_leads, :isfollowup, :boolean, default: true
  end
end
