class Haunt < ApplicationRecord
  has_many  :recommendations, class_name: "Recommendation", foreign_key: "haunt_id", dependent: :destroy
  belongs_to :hometown, required: true, class_name: "Hometown", foreign_key: "hometown_id"
end
