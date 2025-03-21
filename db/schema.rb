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

ActiveRecord::Schema[8.0].define(version: 2025_03_14_081029) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "blocks", force: :cascade do |t|
    t.integer "component_id", null: false
    t.integer "page_id", null: false
    t.integer "parent_block_id"
    t.string "name", null: false
    t.integer "order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["component_id"], name: "index_blocks_on_component_id"
    t.index ["page_id"], name: "index_blocks_on_page_id"
    t.index ["parent_block_id"], name: "index_blocks_on_parent_block_id"
  end

  create_table "components", force: :cascade do |t|
    t.string "name", null: false
    t.string "filename", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "children", default: false
    t.index ["filename"], name: "index_components_on_filename", unique: true
  end

  create_table "default_props", force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.string "prop_type", null: false
    t.string "default", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "component_id"
    t.index ["component_id"], name: "index_default_props_on_component_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title", null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_pages_on_slug", unique: true
  end

  create_table "props", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "value"
    t.integer "block_id"
    t.integer "default_prop_id"
    t.index ["block_id"], name: "index_props_on_block_id"
    t.index ["default_prop_id"], name: "index_props_on_default_prop_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "blocks", "blocks", column: "parent_block_id"
  add_foreign_key "blocks", "components"
  add_foreign_key "blocks", "pages", on_delete: :cascade
  add_foreign_key "default_props", "components"
  add_foreign_key "props", "blocks"
end
