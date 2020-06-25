class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.string :title
      t.string :location
      t.integer :nb_of_days
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
