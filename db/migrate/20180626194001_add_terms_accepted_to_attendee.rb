class AddTermsAcceptedToAttendee < ActiveRecord::Migration[5.1]
  def change
    add_column :attendees, :terms_accepted, :boolean
  end
end
