class AddMediaTypeToBlocks < ActiveRecord::Migration[6.0]
  def change
    add_column :blocks, :mediatype, :string
  end
end
