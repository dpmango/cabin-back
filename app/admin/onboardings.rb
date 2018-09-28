ActiveAdmin.register Onboarding do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :onboarding_id, :company_uen, :company_name, :company_activity, :company_addres, :company_revenue, :consumers_list, :suppliers_list, :payments_to_list, :payments_from_list, :paidup_capital, :company_relations, :paidup_capital_origins, :shareholders_individulas, :shareholders_corporate, :other_beneficiaries, :other_controllers, :name, :designation, :phone, :email, :ispending, :isproduction
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
  column :company_name
  column :company_uen
  column :company_activity
  column :company_addres
  column :company_revenue
  column :consumers_list
  column :suppliers_list
  column :payments_to_list
  column :payments_from_list
  column :paidup_capital
  column :company_relations
  column :paidup_capital_origins
  column :shareholders_individulas
  column :shareholders_corporate
  column :other_beneficiaries
  column :other_controllers
  column :name
  column :designation
  column :phone
  column :email
  column :created_at

  actions
end

end
