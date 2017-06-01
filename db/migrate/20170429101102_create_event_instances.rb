class CreateEventInstances < ActiveRecord::Migration[5.0]
  def change
    create_table :event_instances do |t|
      t.text :form
      t.datetime :start_time
      t.datetime :end_time
      t.references :address, foreign_key: true
      t.text :details
      t.decimal :cost

      t.timestamps
    end
  end
end
