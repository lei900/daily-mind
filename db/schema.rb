# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_20_072713) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "choice_distortions", force: :cascade do |t|
    t.bigint "choice_id"
    t.bigint "distortion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_id"], name: "index_choice_distortions_on_choice_id"
    t.index ["distortion_id"], name: "index_choice_distortions_on_distortion_id"
  end

  create_table "choices", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.string "content"
    t.boolean "is_correct_choice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_choices_on_question_id"
  end

  create_table "communities", force: :cascade do |t|
    t.string "name", null: false
    t.string "introduction"
    t.string "thumbnail", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_communities_on_name", unique: true
  end

  create_table "community_entries", force: :cascade do |t|
    t.bigint "community_id", null: false
    t.bigint "entry_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id", "entry_id"], name: "index_community_entries_on_community_id_and_entry_id", unique: true
    t.index ["community_id"], name: "index_community_entries_on_community_id"
    t.index ["entry_id"], name: "index_community_entries_on_entry_id"
  end

  create_table "diaries", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "mood", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "distortions", force: :cascade do |t|
    t.string "name"
    t.string "definition"
    t.text "description"
    t.string "thumbnail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.string "entryable_type"
    t.integer "entryable_id"
    t.bigint "user_id", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_uid"
    t.index ["user_id"], name: "index_entries_on_user_id"
    t.index ["user_uid"], name: "index_entries_on_user_uid"
  end

  create_table "entry_distortions", force: :cascade do |t|
    t.bigint "distortion_id", null: false
    t.bigint "entry_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["distortion_id"], name: "index_entry_distortions_on_distortion_id"
    t.index ["entry_id"], name: "index_entry_distortions_on_entry_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "title"
    t.string "caption"
    t.text "detailed_description"
    t.string "image"
    t.text "conclusion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "participants_number", default: 0
  end

  create_table "questions", force: :cascade do |t|
    t.text "body"
    t.text "result_interpretation"
    t.bigint "exercise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "qid"
    t.index ["exercise_id"], name: "index_questions_on_exercise_id"
  end

  create_table "thought_analyses", force: :cascade do |t|
    t.text "negative_thought"
    t.text "new_thought"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "uid", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "bio"
    t.string "nickname"
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

  add_foreign_key "choices", "questions"
  add_foreign_key "community_entries", "communities"
  add_foreign_key "community_entries", "entries"
  add_foreign_key "entries", "users"
  add_foreign_key "entry_distortions", "distortions"
  add_foreign_key "entry_distortions", "entries"
  add_foreign_key "questions", "exercises"
end
