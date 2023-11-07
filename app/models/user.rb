class User < ApplicationRecord
  has_many :subscriptions
  has_many :users, :through => subscriptions
  validates :nickname, uniqueness: true
  has_secure_password
end
