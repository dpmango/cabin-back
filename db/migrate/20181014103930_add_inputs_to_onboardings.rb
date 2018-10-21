class AddInputsToOnboardings < ActiveRecord::Migration[5.1]
  def change
    add_column :onboardings, :shareholders_individulas_array, :text
    add_column :onboardings, :shareholders_corporate_array, :text
    add_column :onboardings, :a_date_fye, :datetime
    add_column :onboardings, :a_date_agm, :datetime
    add_column :onboardings, :a_date_renewal, :datetime
  end
end
