class MakeAccountEmailNotNullAndPasswordNotNull < ActiveRecord::Migration[8.0]
  def change
    change_column_null :accounts, :email, false
    change_column_null :accounts, :password_digest, false
  end
end
