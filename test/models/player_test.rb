require "test_helper"
require 'rspec'

class PlayerTest < ActiveSupport::TestCase
  test "should not save player without id" do
    Player = player_id.new
    assert_not Player.save, "Saved the player without id"
  end
end

describe Player, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:player_id) }
    it { should validate_uniqueness_of(:player_id) }
    it { should validate_numericality_of(:kda) }
    it { should validate_numericality_of(:winrate) }
    it { should validate_numericality_of(:avg_elim) }
    it { should validate_numericality_of(:avg_ass) }
    it { should validate_numericality_of(:avg_death) }
    it { should validate_numericality_of(:avg_dam) }
    it { should validate_numericality_of(:avg_heal) }
  end

  describe 'associations' do
    it { should have_many(:subscriptions) }
    it { should have_many(:users).through(:subscriptions) }
  end
end