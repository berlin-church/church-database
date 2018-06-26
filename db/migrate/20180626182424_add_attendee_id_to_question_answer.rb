class AddAttendeeIdToQuestionAnswer < ActiveRecord::Migration[5.1]
  def change
    add_reference :question_answers, :attendee, foreign_key: true
  end
end
