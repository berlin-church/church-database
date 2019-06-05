class AddAddresses < ActiveRecord::Migration[5.0]
  def change
    return if table_exists? :addresses

    create_table "addresses", force: :cascade do |t|
      t.string   "street"
      t.string   "street_number"
      t.string   "zip_code"
      t.string   "city"
      t.string   "country"
      t.datetime "created_at",    null: false
      t.datetime "updated_at",    null: false
      t.integer  "member_id"
      t.index ["member_id"], name: "index_addresses_on_member_id"
    end
  end
end
