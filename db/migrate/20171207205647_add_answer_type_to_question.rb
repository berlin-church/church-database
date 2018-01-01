class AddAnswerTypeToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :answer_type, :integer
  end
end
