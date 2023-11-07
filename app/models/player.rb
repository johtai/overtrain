class Player < ApplicationRecord
  has_many :subscriptions
  has_many :players, :through => :subscriptions
  validates :player_id, presence: true
  validates :player_id, uniqueness: true
  validates :kda, :winrate,:avg_elim, :avg_ass, :avg_death, :avg_dam, :avg_heal, numericality: true
end
