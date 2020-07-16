class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :follower_pseudo

      t.timestamps
    end
  end
end
