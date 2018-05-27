class CreateSignupLeads < ActiveRecord::Migration[5.1]
  def change
    create_table :signup_leads do |t|
      t.string :email, unique: true
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :phone
      t.string :company_industry
      t.string :company_old
      t.string :company_employees
      t.date :meeting_date
      t.string :meeting_time
      t.boolean :ispending, default: true

      t.timestamps
    end
  end
end
