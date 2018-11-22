class AddDiscardedAtToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :discarded_at, :datetime
    add_index :members, :discarded_at
  end
end
