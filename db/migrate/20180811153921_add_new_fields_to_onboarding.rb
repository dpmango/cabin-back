class AddNewFieldsToOnboarding < ActiveRecord::Migration[5.1]
  def change
    add_column :onboardings, :other_beneficiaries, :boolean
    add_column :onboardings, :other_controllers, :boolean
    add_column :onboardings, :name, :string
    add_column :onboardings, :designation, :string
    add_column :onboardings, :phone, :string
    add_column :onboardings, :email, :string
  end
end
