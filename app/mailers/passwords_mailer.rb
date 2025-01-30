class PasswordsMailer < ApplicationMailer
  def reset(account)
    @account = account
    mail subject: "Reset your password", to: account.email
  end
end
