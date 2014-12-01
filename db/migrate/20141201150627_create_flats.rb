class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :currency
      t.references :owner, index: true

      t.timestamps
    end
  end
end
