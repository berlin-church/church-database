class DropFormFromEvent < ActiveRecord::Migration[5.0]
  def change
    remove_column :event_instances, :form
  end
end
