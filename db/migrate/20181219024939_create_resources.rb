class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.float :latitude
      t.float :longitude
      t.string :phone
      t.text :description
      t.boolean :food
      t.boolean :health
      t.boolean :shelter
      t.integer :status, default: 0
      t.integer :shares, default: 0

      t.timestamps
    end
  end
end
