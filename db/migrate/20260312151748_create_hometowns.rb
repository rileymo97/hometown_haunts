class CreateHometowns < ActiveRecord::Migration[8.0]
  def change
    create_table :hometowns do |t|
      t.string :name

      t.timestamps
    end
  end
end
