class Conversation < ApplicationRecord
  belongs_to :user
  belongs_to :conversee, :class_name => 'User'
  has_many :messages, dependent: :destroy
end
