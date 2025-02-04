RSpec.configure do |config|
  config.before(:each) do
     Faker::UniqueGenerator.clear
     Account.destroy_all
  end
end
