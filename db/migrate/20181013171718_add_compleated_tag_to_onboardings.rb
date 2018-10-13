class AddCompleatedTagToOnboardings < ActiveRecord::Migration[5.1]
  def change
    add_column :onboardings, :isCompleated, :boolean, :default => false
  end
end
