class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :house, :male, :culture, :imageLink
  has_many :likes
  has_many :users
end
