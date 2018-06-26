class RemoveMemberIdFromQuestionAnswer < ActiveRecord::Migration[5.1]
  def change
    remove_column :question_answers, :member_id
    remove_column :option_answers, :member_id
  end
end
