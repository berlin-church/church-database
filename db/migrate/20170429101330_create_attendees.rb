class CreateAttendees < ActiveRecord::Migration[5.0]
  def change
    create_table :attendees do |t|
      t.text :form_reply
      t.boolean :paid
      t.references :member, foreign_key: true
      t.references :event_instance, foreign_key: true
      t.boolean :canceled

      t.timestamps
    end
  end
end
