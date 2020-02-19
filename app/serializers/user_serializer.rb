class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :gender, :email, :bio, :avatar
  has_many :posts
end
