class AddLocationLongitudeToHome < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :location_longitude, :float
  end
end
