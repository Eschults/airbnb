class RemoveUrlFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :url, :string
  end
end
