class AddLocationFormattedAddressToHome < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :location_formatted_address, :string
  end
end
