class AddStatusToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :status, :integer, default: 0
  end
end
