class AddCoordinatesToPuppies < ActiveRecord::Migration[6.0]
  def change
    add_column :puppies, :latitude, :float
    add_column :puppies, :longitude, :float
    add_column :puppies, :address, :string
  end
end
