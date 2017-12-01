class AddLocationLatitudeToHome < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :location_latitude, :float
  end
end
