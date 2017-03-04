# frozen_string_literal: true
class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :birthday
      t.string :email
      t.string :phone1
      t.string :phone2

      t.timestamps
    end
  end
end
