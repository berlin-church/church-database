class AddCreatedByToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :created_by, :integer, default: 1
  end
end
