require "test_helper"

class SubscriptionTest < ActiveSupport::TestCase
  test "should not save subscription without user_id" do
    Subscription = user_id.new
    assert_not Subscription.save, "Saved the subscription without user_id"
  end
end
