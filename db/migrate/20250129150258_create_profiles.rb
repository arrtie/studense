class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.belongs_to :account,
      type: :string,
      null: false,
      foreign_key: { primary_key: :uuid }
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.datetime :birthdate, null: false
      t.timestamps
    end
  end
end
