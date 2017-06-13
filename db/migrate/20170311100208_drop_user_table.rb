class DropUserTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :users if table_exists? :users
  end
end
