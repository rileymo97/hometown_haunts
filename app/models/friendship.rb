class Friendship < ApplicationRecord
  belongs_to :requester, required: true, class_name: "User", foreign_key: "requester_id"
  belongs_to :recipient, required: true, class_name: "User", foreign_key: "recipient_id"
end
