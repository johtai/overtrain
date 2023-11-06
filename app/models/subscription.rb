class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :player
  validates :user_id, :player_id, presence: true
  #validates_associated :user, :player
end
