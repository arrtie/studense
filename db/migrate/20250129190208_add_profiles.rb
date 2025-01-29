# frozen_string_literal: true

class AddProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.references :account
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.datetime :birthdate, null: false
      t.timestamps
    end

    add_column :accounts, :profile_id, :string
    add_index :accounts, :profile_id
  end
end
