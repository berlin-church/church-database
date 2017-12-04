class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.references :question_group, foreign_key: true
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
