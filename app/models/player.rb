class Player < ApplicationRecord
  has_many :subscriptions
  has_many :players, :through => :subscriptions
end
