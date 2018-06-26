class AddAttendeeIdToOptionAnswer < ActiveRecord::Migration[5.1]
  def change
    add_reference :option_answers, :attendee, foreign_key: true
  end
end
