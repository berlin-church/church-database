class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :street_number
      t.string :area_code
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
