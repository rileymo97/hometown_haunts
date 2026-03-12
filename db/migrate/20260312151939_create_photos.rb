class CreatePhotos < ActiveRecord::Migration[8.0]
  def change
    create_table :photos do |t|
      t.string :image
      t.integer :recommendation_id

      t.timestamps
    end
  end
end
