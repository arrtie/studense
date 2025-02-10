class CreateAdminRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :admin_requests do |t|
      t.references :approvable, polymorphic: true, null: false
      t.integer :status, default: :pending, null: false
      t.references :admin
      t.timestamps
    end
  end
end
