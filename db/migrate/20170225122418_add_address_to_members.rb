class AddAddressToMembers < ActiveRecord::Migration[5.0]
  def change
    add_reference :members, :address, foreign_key: true
  end
end
