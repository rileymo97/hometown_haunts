class CreateHaunts < ActiveRecord::Migration[8.0]
  def change
    create_table :haunts do |t|
      t.integer :hometown_id
      t.string :name
      t.string :category
      t.string :address

      t.timestamps
    end
  end
end
