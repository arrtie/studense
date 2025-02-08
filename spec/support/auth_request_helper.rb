module AuthRequestHelper
  def test_login(account)
    @env ||= {}
    post session_url email: account.email, password: account.password
    @env = { Cookie: response.headers["set-cookie"][0] }
  end
end
