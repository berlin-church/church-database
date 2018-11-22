class AddStatusChangedAtToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :status_changed_at, :datetime
  end
end
