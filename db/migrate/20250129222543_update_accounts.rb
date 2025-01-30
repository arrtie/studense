class UpdateAccounts < ActiveRecord::Migration[8.0]
  def change
    add_column :accounts, :email, :string
    add_column :accounts, :password_digest, :string

    Account.reset_column_information # Make sure to reload the model
    Account.find_each do |account|
      account.update(email: Faker::Internet.unique.email)
      account.update(password_digest: Faker::Internet.password)
    end

    remove_column :profiles, :email, :string

    add_index :accounts, :email, unique: true
  end
end
