ActiveRecord::Schema.define(version: 20150904144437) do
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "content",    null: false
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "content",    null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",   null: false
    t.string   "email",      null: false
    t.string   "password",   null: false
    t.string   "avatar"
    t.string   "city"
    t.string   "state"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
