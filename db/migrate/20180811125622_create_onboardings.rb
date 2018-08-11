class CreateOnboardings < ActiveRecord::Migration[5.1]
  def change
    create_table :onboardings do |t|
      t.string :onboarding_id, unique: true
      t.string :company_uen
      t.string :company_name
      t.string :company_activity
      t.string :company_addres
      t.string :company_revenue

      t.string :consumers_list
      t.string :suppliers_list
      t.string :payments_to_list
      t.string :payments_from_list

      t.string :paidup_capital
      t.string :company_relations
      t.string :paidup_capital_origins

      t.string :shareholders_individulas
      t.string :shareholders_corporate

      t.boolean :ispending, default: true
      t.boolean :isproduction, default: false
      t.timestamps
    end
  end
end
