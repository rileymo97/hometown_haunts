# == Schema Information
#
# Table name: haunts
#
#  id          :bigint           not null, primary key
#  address     :string
#  category    :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  hometown_id :integer
#
class Haunt < ApplicationRecord
  has_many  :recommendations, class_name: "Recommendation", foreign_key: "haunt_id", dependent: :destroy
  belongs_to :hometown, required: true, class_name: "Hometown", foreign_key: "hometown_id"
end
