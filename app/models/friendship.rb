# == Schema Information
#
# Table name: friendships
#
#  id             :bigint           not null, primary key
#  request_status :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  recipient_id   :integer
#  requester_id   :integer
#
class Friendship < ApplicationRecord
  belongs_to :requester, required: true, class_name: "User", foreign_key: "requester_id"
  belongs_to :recipient, required: true, class_name: "User", foreign_key: "recipient_id"
end
