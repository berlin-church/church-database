class CreateLeaders < ActiveRecord::Migration[5.1]
  def change
    create_table :leaders do |t|
      t.references :member, foreign_key: true
      t.references :event_instance, foreign_key: true

      t.timestamps
    end
  end
end
