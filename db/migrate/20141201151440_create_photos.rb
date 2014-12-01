class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.references :flat, index: true

      t.timestamps
    end
  end
end
