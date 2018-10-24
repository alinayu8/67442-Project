begin
  require "test_helper"
rescue LoadError => e
  raise e unless ENV['RAILS_ENV'] == "production"
end

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
