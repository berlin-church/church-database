class AddEventIdToEventInstance < ActiveRecord::Migration[5.0]
  def change
    add_reference :event_instances, :event, foreign_key: true
  end
end
