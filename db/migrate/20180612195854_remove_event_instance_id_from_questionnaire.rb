class RemoveEventInstanceIdFromQuestionnaire < ActiveRecord::Migration[5.1]
  def change
    remove_column :questionnaires, :event_instance_id
  end
end
