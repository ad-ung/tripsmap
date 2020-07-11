class CreateFavoris < ActiveRecord::Migration[6.0]
  def change
    create_table :favoris do |t|
      t.references :user, null: false, foreign_key: true
      t.references :step, null: false, foreign_key: true

      t.timestamps
    end
  end
end
