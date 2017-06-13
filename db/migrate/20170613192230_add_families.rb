class AddFamilies < ActiveRecord::Migration[5.0]
  def change
    return if table_exists? :families
    create_table "families", force: :cascade do |t|
      t.string   "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
