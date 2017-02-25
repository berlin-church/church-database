class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :FirstName
      t.string :LastName
      t.string :Gender
      t.string :Email
      t.string :Phone1
      t.string :Phone2

      t.timestamps
    end
  end
end
