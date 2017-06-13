class AddMemberSelfRelationship < ActiveRecord::Migration[5.0]
  def change
    return if table_exists? :members_members
    
    create_table "members_members", id: false, force: :cascade do |t|
      t.integer "member_id", null: false
    end
  end
end
