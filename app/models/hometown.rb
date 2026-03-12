# == Schema Information
#
# Table name: hometowns
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Hometown < ApplicationRecord
  has_many  :haunts, class_name: "Haunt", foreign_key: "hometown_id", dependent: :destroy
  has_many :recommendations, through: :haunts, source: :recommendations
end
