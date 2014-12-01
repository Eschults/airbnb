class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.float :latitude
      t.float :longitude
      t.integer :number
      t.string :street
      t.string :city
      t.string :country
      t.string :zip_code
      t.references :flat, index: true

      t.timestamps
    end
  end
end
