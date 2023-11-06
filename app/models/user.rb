class User < ApplicationRecord
  has_many :subscriptions
  has_many :users, :through => subscriptions
  has_secure_password
end
