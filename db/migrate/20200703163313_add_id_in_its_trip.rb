class AddIdInItsTrip < ActiveRecord::Migration[6.0]
  def change
    add_column :steps, :id_in_its_trip, :integer
  end
end
