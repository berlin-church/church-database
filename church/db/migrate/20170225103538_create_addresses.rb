class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :Street
      t.string :Street_number
      t.string :Area_code
      t.string :City
      t.string :Country

      t.timestamps
    end
  end
end
