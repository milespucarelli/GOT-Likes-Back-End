class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :url, :name, :house, :gender, :culture, :playedBy
  has_many :likes
  has_many :users
end
