class LikeSerializer < ActiveModel::Serializer
  attributes :id, :user
  has_one :post
  has_one :user
end
