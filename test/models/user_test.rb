require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without id" do
    User = user_id.new
    assert_not User.save, "Saved the user without id"
  end
end
