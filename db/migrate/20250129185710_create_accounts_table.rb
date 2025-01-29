# frozen_string_literal: true

class CreateAccountsTable < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.timestamps
    end
  end
end
