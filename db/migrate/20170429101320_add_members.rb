class AddMembers < ActiveRecord::Migration[5.0]
  def change
    return if table_exists? :members
    create_table "members", force: :cascade do |t|
      t.string   "first_name"
      t.string   "last_name"
      t.string   "gender"
      t.date     "birthday"
      t.string   "email"
      t.string   "phone1"
      t.string   "phone2"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer  "family_id"
      t.integer  "address_id"
      t.index ["address_id"], name: "index_members_on_address_id"
      t.index ["family_id"], name: "index_members_on_family_id"
    end
  end
end
