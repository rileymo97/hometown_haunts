# == Schema Information
#
# Table name: recommendations
#
#  id                       :bigint           not null, primary key
#  appx_times_haunted       :integer
#  specific_recommendations :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  haunt_id                 :integer
#  user_id                  :integer
#
class Recommendation < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  has_many  :photos, class_name: "Photo", foreign_key: "recommendation_id", dependent: :destroy
  belongs_to :haunt, required: true, class_name: "Haunt", foreign_key: "haunt_id"
  has_one  :hometown, through: :haunt, source: :hometown
end
