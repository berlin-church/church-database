class CreateOptionAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :option_answers do |t|
      t.references :question_option, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
