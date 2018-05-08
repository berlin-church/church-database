class AddIsVisibleToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :is_visible, :boolean
  end
end
