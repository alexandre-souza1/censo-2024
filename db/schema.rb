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

ActiveRecord::Schema[7.1].define(version: 2024_11_27_000604) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.bigint "question_id", null: false
    t.string "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["survey_id"], name: "index_answers_on_survey_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stage"
    t.string "category"
  end

  create_table "second_stage_answers", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.bigint "second_stage_question_id", null: false
    t.string "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["second_stage_question_id"], name: "index_second_stage_answers_on_second_stage_question_id"
    t.index ["survey_id"], name: "index_second_stage_answers_on_survey_id"
  end

  create_table "second_stage_questions", force: :cascade do |t|
    t.string "text"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "recommendation_score"
    t.text "general_feedback"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "recommendation_score"
    t.text "general_feedback"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "surveys"
  add_foreign_key "second_stage_answers", "second_stage_questions"
  add_foreign_key "second_stage_answers", "surveys"
end
