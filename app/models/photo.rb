class Photo < ApplicationRecord
  belongs_to :recommendation, required: true, class_name: "Recommendation", foreign_key: "recommendation_id"
end
