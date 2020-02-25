class FollowingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :followee_id
end
