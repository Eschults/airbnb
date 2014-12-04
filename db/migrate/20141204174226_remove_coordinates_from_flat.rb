class RemoveCoordinatesFromFlat < ActiveRecord::Migration
  def change
    remove_column :flats, :latitude, :float
    remove_column :flats, :longitude, :float
  end
end
