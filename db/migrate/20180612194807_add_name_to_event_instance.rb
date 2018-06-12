class AddNameToEventInstance < ActiveRecord::Migration[5.1]
  def change
    add_column :event_instances, :name, :string
  end
end
