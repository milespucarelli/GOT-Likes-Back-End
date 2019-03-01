class User < ApplicationRecord
  has_many :likes
  has_many :characters, through: :likes
end
