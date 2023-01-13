ActiveRecord::Schema[7.0].define(version: 2023_01_12_072322) do
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_groups_on_owner_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "value"
    t.bigint "voting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["voting_id"], name: "index_options_on_voting_id"
  end

  create_table "user_groups", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.boolean "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_user_groups_on_group_id"
    t.index ["user_id"], name: "index_user_groups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "email"
    t.string "avatar"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "option_id", null: false
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_votes_on_option_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  create_table "votings", force: :cascade do |t|
    t.string "name"
    t.bigint "author_id"
    t.text "question"
    t.string "type"
    t.boolean "active"
    t.date "start_date"
    t.date "stop_date"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_votings_on_group_id"
  end

end
