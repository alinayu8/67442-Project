begin
  require "test_helper"
rescue LoadError => e
  raise e unless ENV['RAILS_ENV'] == "production"
end

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
