class AddLastNameToAdminUser < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_users, :last_name, :string
  end
end
