class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.boolean :confirmed
      t.belongs_to :user_1, index: true, foreign_key: true
      t.belongs_to :user_2, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
