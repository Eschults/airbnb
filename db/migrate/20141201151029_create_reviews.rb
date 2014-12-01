class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.references :flat, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
