class User < ApplicationRecord
  has_many :subscriptions
  has_many :players, :through => :subscriptions

  validates :user_id, presence: true, uniqueness: true
  has_secure_password
end
