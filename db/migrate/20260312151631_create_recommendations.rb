class CreateRecommendations < ActiveRecord::Migration[8.0]
  def change
    create_table :recommendations do |t|
      t.string :specific_recommendations
      t.integer :user_id
      t.integer :haunt_id
      t.integer :appx_times_haunted

      t.timestamps
    end
  end
end
