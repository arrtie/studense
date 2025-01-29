class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.timestamps
      t.string :uuid, default: -> { 'gen_random_uuid()' }, null: false
    end
  end
end
