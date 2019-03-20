class AddMemberToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :admin_users, :member, foreign_key: true
  end
end
