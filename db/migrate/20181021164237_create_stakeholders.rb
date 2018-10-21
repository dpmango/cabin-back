class CreateStakeholders < ActiveRecord::Migration[5.1]
  def change
    create_table :stakeholders do |t|
      t.string :name
      t.string :passport
      t.string :birthday
      t.string :nationality
      t.string :phone
      t.string :email
      t.string :residentionalAdress
      t.boolean :ispending, default: true
      t.boolean :isfollowup, default: true
      t.boolean :isproduction, default: false

      t.timestamps
    end
  end
end
