class User < ApplicationRecord
  has_many :subscriptions
  has_many :users, :through => :subscriptions
  validates :user_id, presence: true
  validates :user_id, uniqueness: true
  has_secure_password
end
