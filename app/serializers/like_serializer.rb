class LikeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :character_id
end
