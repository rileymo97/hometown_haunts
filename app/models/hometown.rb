class Hometown < ApplicationRecord
  has_many  :haunts, class_name: "Haunt", foreign_key: "hometown_id", dependent: :destroy
  has_many :recommendations, through: :haunts, source: :recommendations
end
