ActiveAdmin.register SignupLead do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :isproduction, :ispending, :isfollowup, :email, :phone, :first_name, :last_name, :pricing_plan, :pricing_options, :meeting_date, :meeting_time, :company_name, :company_industry, :company_old, :company_employees, :email_instead

#
# or
#

# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
  selectable_column
  column :id
  column :isproduction
  column :ispending
  column :isfollowup
  column :email
  column :phone
  column :first_name
  column :last_name
  column :pricing_plan
  column :pricing_options
  column :meeting_date
  column :meeting_time
  column :email_instead
  column :company_name
  column :company_industry
  column :company_old
  column :company_employees

  actions
end

end
