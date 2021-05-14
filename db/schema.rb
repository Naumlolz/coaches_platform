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

ActiveRecord::Schema.define(version: 2021_05_14_034247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "coaches", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.text "description"
    t.integer "age"
    t.string "gender"
    t.string "email", null: false
    t.string "password", null: false
    t.string "expertise"
    t.string "education"
    t.string "experience"
    t.string "certificate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "programs", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "techniques", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.bigint "program_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["program_id"], name: "index_techniques_on_program_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "age"
    t.text "description"
    t.string "gender"
    t.string "email", null: false
    t.string "password", null: false
    t.bigint "coach_id"
    t.bigint "program_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_users_on_coach_id"
    t.index ["program_id"], name: "index_users_on_program_id"
  end

  create_table "users_coaches_invitations", force: :cascade do |t|
    t.string "body", null: false
    t.boolean "accepted", default: false
    t.bigint "user_id"
    t.bigint "coach_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_users_coaches_invitations_on_coach_id"
    t.index ["user_id"], name: "index_users_coaches_invitations_on_user_id"
  end

  create_table "users_techniques", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "technique_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["technique_id"], name: "index_users_techniques_on_technique_id"
    t.index ["user_id"], name: "index_users_techniques_on_user_id"
  end

  create_table "users_techniques_ratings", force: :cascade do |t|
    t.string "rate"
    t.bigint "user_id"
    t.bigint "technique_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["technique_id"], name: "index_users_techniques_ratings_on_technique_id"
    t.index ["user_id"], name: "index_users_techniques_ratings_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "techniques", "programs"
  add_foreign_key "users", "coaches"
  add_foreign_key "users", "programs"
  add_foreign_key "users_coaches_invitations", "coaches"
  add_foreign_key "users_coaches_invitations", "users"
  add_foreign_key "users_techniques", "techniques"
  add_foreign_key "users_techniques", "users"
  add_foreign_key "users_techniques_ratings", "techniques"
  add_foreign_key "users_techniques_ratings", "users"
end
