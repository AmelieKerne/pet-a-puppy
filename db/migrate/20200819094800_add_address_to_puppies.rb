class AddAddressToPuppies < ActiveRecord::Migration[6.0]
  def change
  add_column :puppies, :address, :string
  end
end
