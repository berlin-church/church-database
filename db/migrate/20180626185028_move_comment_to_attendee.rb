class MoveCommentToAttendee < ActiveRecord::Migration[5.1]
  def change
    add_column :attendees, :comment, :text
  end
end
