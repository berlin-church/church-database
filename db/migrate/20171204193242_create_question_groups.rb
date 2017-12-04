class CreateQuestionGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :question_groups do |t|
      t.references :questionaire, foreign_key: true
      t.string :title
      t.text :subtitle
      t.integer :position

      t.timestamps
    end
  end
end
