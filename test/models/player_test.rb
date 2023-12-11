require "test_helper"

class PlayerTest < ActiveSupport::TestCase
  test "should not save player without id" do
    Player = player_id.new
    assert_not Player.save, "Saved the player without id"
  end
end
