class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :house, :gender, :culture, :playedBy
  has_many :likes
  has_many :users
end
