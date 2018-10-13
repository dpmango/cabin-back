class ChangeOnboadingStatusDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :onboardings, :a_status, :integer, :default => 1
  end
end
