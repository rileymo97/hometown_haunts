class CreateFriendships < ActiveRecord::Migration[8.0]
  def change
    create_table :friendships do |t|
      t.integer :requester_id
      t.integer :recipient_id
      t.string :request_status

      t.timestamps
    end
  end
end
