# == Schema Information
#
# Table name: photos
#
#  id                :bigint           not null, primary key
#  image             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  recommendation_id :integer
#
class Photo < ApplicationRecord
  belongs_to :recommendation, required: true, class_name: "Recommendation", foreign_key: "recommendation_id"
end
