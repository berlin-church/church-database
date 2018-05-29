class AddImageUrlToEventInstances < ActiveRecord::Migration[5.1]
  def change
    add_column :event_instances, :image_url, :string
    add_column :event_instances, :description, :text
  end
end
