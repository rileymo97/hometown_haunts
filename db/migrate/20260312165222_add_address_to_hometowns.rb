class AddAddressToHometowns < ActiveRecord::Migration[8.0]
  def change
    add_column :hometowns, :address, :string
  end
end
