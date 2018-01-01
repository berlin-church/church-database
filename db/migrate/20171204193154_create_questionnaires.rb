class CreateQuestionnaires < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires do |t|
      t.references :event_instance, foreign_key: true
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
