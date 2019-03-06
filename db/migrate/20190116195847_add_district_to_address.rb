class AddDistrictToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :district, :string
  end
end
