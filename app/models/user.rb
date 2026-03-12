class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :requested_friendships, class_name: "Friendship", foreign_key: "requester_id", dependent: :destroy
  has_many  :received_friendships, class_name: "Friendship", foreign_key: "recipient_id", dependent: :destroy
  has_many  :recommendations, class_name: "Recommendation", foreign_key: "user_id", dependent: :destroy
  has_many :recipients, through: :requested_friendships, source: :recipient
  has_many :requesters, through: :received_friendships, source: :requester
end
