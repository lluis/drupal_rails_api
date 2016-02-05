# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160205163718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", primary_key: "aid", id: :string, limit: 255, default: "0", force: :cascade do |t|
    t.string "type",       limit: 32,  default: "",  null: false
    t.string "callback",   limit: 255, default: "",  null: false
    t.binary "parameters",                           null: false
    t.string "label",      limit: 255, default: "0", null: false
  end

  create_table "authmap", primary_key: "aid", force: :cascade do |t|
    t.integer "uid",                  default: 0,  null: false
    t.string  "authname", limit: 128, default: "", null: false
    t.string  "module",   limit: 128, default: "", null: false
    t.index ["authname"], name: "authmap_authname_key", unique: true, using: :btree
  end

  create_table "batch", primary_key: "bid", id: :integer, limit: 8, force: :cascade do |t|
    t.string  "token",     limit: 64, null: false
    t.integer "timestamp",            null: false
    t.binary  "batch"
    t.index ["token"], name: "batch_token_idx", using: :btree
  end

  create_table "block", primary_key: "bid", force: :cascade do |t|
    t.string  "module",     limit: 64,  default: "",  null: false
    t.string  "delta",      limit: 32,  default: "0", null: false
    t.string  "theme",      limit: 64,  default: "",  null: false
    t.integer "status",     limit: 2,   default: 0,   null: false
    t.integer "weight",                 default: 0,   null: false
    t.string  "region",     limit: 64,  default: "",  null: false
    t.integer "custom",     limit: 2,   default: 0,   null: false
    t.integer "visibility", limit: 2,   default: 0,   null: false
    t.text    "pages",                                null: false
    t.string  "title",      limit: 255, default: "",  null: false
    t.integer "cache",      limit: 2,   default: 1,   null: false
    t.index ["theme", "module", "delta"], name: "block_tmd_key", unique: true, using: :btree
    t.index ["theme", "status", "region", "weight", "module"], name: "block_list_idx", using: :btree
  end

  create_table "block_custom", primary_key: "bid", force: :cascade do |t|
    t.text   "body"
    t.string "info",   limit: 128, default: "", null: false
    t.string "format", limit: 255
    t.index ["info"], name: "block_custom_info_key", unique: true, using: :btree
  end

  create_table "block_node_type", primary_key: ["module", "delta", "type"], force: :cascade do |t|
    t.string "module", limit: 64, null: false
    t.string "delta",  limit: 32, null: false
    t.string "type",   limit: 32, null: false
    t.index ["type"], name: "block_node_type_type_idx", using: :btree
  end

  create_table "block_role", primary_key: ["module", "delta", "rid"], force: :cascade do |t|
    t.string  "module", limit: 64, null: false
    t.string  "delta",  limit: 32, null: false
    t.integer "rid",    limit: 8,  null: false
    t.index ["rid"], name: "block_role_rid_idx", using: :btree
  end

  create_table "blocked_ips", primary_key: "iid", force: :cascade do |t|
    t.string "ip", limit: 40, default: "", null: false
    t.index ["ip"], name: "blocked_ips_blocked_ip_idx", using: :btree
  end

  create_table "cache", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_expire_idx", using: :btree
  end

  create_table "cache_admin_menu", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_admin_menu_expire_idx", using: :btree
  end

  create_table "cache_block", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_block_expire_idx", using: :btree
  end

  create_table "cache_bootstrap", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_bootstrap_expire_idx", using: :btree
  end

  create_table "cache_features", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_features_expire_idx", using: :btree
  end

  create_table "cache_field", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_field_expire_idx", using: :btree
  end

  create_table "cache_filter", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_filter_expire_idx", using: :btree
  end

  create_table "cache_form", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_form_expire_idx", using: :btree
  end

  create_table "cache_image", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_image_expire_idx", using: :btree
  end

  create_table "cache_libraries", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_libraries_expire_idx", using: :btree
  end

  create_table "cache_mailchimp", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_mailchimp_expire_idx", using: :btree
  end

  create_table "cache_menu", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_menu_expire_idx", using: :btree
  end

  create_table "cache_metatag", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_metatag_expire_idx", using: :btree
  end

  create_table "cache_page", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_page_expire_idx", using: :btree
  end

  create_table "cache_panels", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_panels_expire_idx", using: :btree
  end

  create_table "cache_path", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_path_expire_idx", using: :btree
  end

  create_table "cache_rules", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_rules_expire_idx", using: :btree
  end

  create_table "cache_token", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_token_expire_idx", using: :btree
  end

  create_table "cache_update", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_update_expire_idx", using: :btree
  end

  create_table "cache_variable", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_variable_expire_idx", using: :btree
  end

  create_table "cache_views", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 0, null: false
    t.index ["expire"], name: "cache_views_expire_idx", using: :btree
  end

  create_table "cache_views_data", primary_key: "cid", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "data"
    t.integer "expire",               default: 0, null: false
    t.integer "created",              default: 0, null: false
    t.integer "serialized", limit: 2, default: 1, null: false
    t.index ["expire"], name: "cache_views_data_expire_idx", using: :btree
  end

  create_table "captcha_points", primary_key: "form_id", id: :string, limit: 128, default: "", force: :cascade do |t|
    t.string "module",       limit: 64
    t.string "captcha_type", limit: 64
  end

  create_table "captcha_sessions", primary_key: "csid", force: :cascade do |t|
    t.string  "token",      limit: 64
    t.integer "uid",                    default: 0,  null: false
    t.string  "sid",        limit: 64,  default: "", null: false
    t.string  "ip_address", limit: 128
    t.integer "timestamp",              default: 0,  null: false
    t.string  "form_id",    limit: 128,              null: false
    t.string  "solution",   limit: 128, default: "", null: false
    t.integer "status",                 default: 0,  null: false
    t.integer "attempts",               default: 0,  null: false
    t.index ["csid", "ip_address"], name: "captcha_sessions_csid_ip_idx", using: :btree
  end

  create_table "comment", primary_key: "cid", force: :cascade do |t|
    t.integer "pid",                  default: 0,  null: false
    t.integer "nid",                  default: 0,  null: false
    t.integer "uid",                  default: 0,  null: false
    t.string  "subject",  limit: 64,  default: "", null: false
    t.string  "hostname", limit: 128, default: "", null: false
    t.integer "created",              default: 0,  null: false
    t.integer "changed",              default: 0,  null: false
    t.integer "status",               default: 1,  null: false
    t.string  "thread",   limit: 255,              null: false
    t.string  "name",     limit: 60
    t.string  "mail",     limit: 64
    t.string  "homepage", limit: 255
    t.string  "language", limit: 12,  default: "", null: false
    t.index ["created"], name: "comment_comment_created_idx", using: :btree
    t.index ["nid", "language"], name: "comment_comment_nid_language_idx", using: :btree
    t.index ["nid", "status", "created", "cid", "thread"], name: "comment_comment_num_new_idx", using: :btree
    t.index ["pid", "status"], name: "comment_comment_status_pid_idx", using: :btree
    t.index ["uid"], name: "comment_comment_uid_idx", using: :btree
  end

  create_table "context", primary_key: "name", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.string  "description",    limit: 255, default: "", null: false
    t.string  "tag",            limit: 255, default: "", null: false
    t.text    "conditions"
    t.text    "reactions"
    t.integer "condition_mode",             default: 0
  end

  create_table "ctools_css_cache", primary_key: "cid", id: :string, limit: 128, force: :cascade do |t|
    t.string  "filename", limit: 255
    t.text    "css"
    t.integer "filter",   limit: 2
  end

  create_table "ctools_custom_content", primary_key: "cid", force: :cascade do |t|
    t.string "name",              limit: 255
    t.string "admin_title",       limit: 255
    t.text   "admin_description"
    t.string "category",          limit: 255
    t.text   "settings"
  end

  create_table "ctools_object_cache", primary_key: ["sid", "obj", "name"], force: :cascade do |t|
    t.string  "sid",     limit: 64,              null: false
    t.string  "name",    limit: 128,             null: false
    t.string  "obj",     limit: 128,             null: false
    t.integer "updated", limit: 8,   default: 0, null: false
    t.binary  "data"
    t.index ["updated"], name: "ctools_object_cache_updated_idx", using: :btree
  end

  create_table "date_format_locale", primary_key: ["type", "language"], force: :cascade do |t|
    t.string "format",   limit: 100, null: false
    t.string "type",     limit: 64,  null: false
    t.string "language", limit: 12,  null: false
  end

  create_table "date_format_type", primary_key: "type", id: :string, limit: 64, force: :cascade do |t|
    t.string  "title",  limit: 255,             null: false
    t.integer "locked", limit: 2,   default: 0, null: false
    t.index ["title"], name: "date_format_type_title_idx", using: :btree
  end

  create_table "date_formats", primary_key: "dfid", force: :cascade do |t|
    t.string  "format", limit: 100,             null: false
    t.string  "type",   limit: 64,              null: false
    t.integer "locked", limit: 2,   default: 0, null: false
    t.index ["format", "type"], name: "date_formats_formats_key", unique: true, using: :btree
  end

  create_table "defaultconfig_optionals", primary_key: ["oid", "name"], force: :cascade do |t|
    t.serial  "oid",                            null: false
    t.string  "name",   limit: 255,             null: false
    t.integer "status",             default: 0, null: false
  end

  create_table "disable_breadcrumbs", primary_key: "nid", id: :integer, force: :cascade do |t|
    t.integer "disable_breadcrumb", limit: 2, default: 0, null: false
  end

  create_table "field_conditional_state", force: :cascade do |t|
    t.integer "group_id",                  null: false
    t.string  "control_field", limit: 255, null: false
    t.string  "trigger_state", limit: 15,  null: false
    t.text    "trigger_value",             null: false
  end

  create_table "field_conditional_states_group", primary_key: "group_id", force: :cascade do |t|
    t.string "state",       limit: 15,  null: false
    t.string "entity_type", limit: 255, null: false
    t.string "bundle",      limit: 255, null: false
    t.string "field_name",  limit: 255, null: false
    t.string "type",        limit: 3,   null: false
  end

  create_table "field_config", force: :cascade do |t|
    t.string  "field_name",     limit: 32,               null: false
    t.string  "type",           limit: 128,              null: false
    t.string  "module",         limit: 128, default: "", null: false
    t.integer "active",         limit: 2,   default: 0,  null: false
    t.string  "storage_type",   limit: 128,              null: false
    t.string  "storage_module", limit: 128, default: "", null: false
    t.integer "storage_active", limit: 2,   default: 0,  null: false
    t.integer "locked",         limit: 2,   default: 0,  null: false
    t.binary  "data",                                    null: false
    t.integer "cardinality",    limit: 2,   default: 0,  null: false
    t.integer "translatable",   limit: 2,   default: 0,  null: false
    t.integer "deleted",        limit: 2,   default: 0,  null: false
    t.index ["active"], name: "field_config_active_idx", using: :btree
    t.index ["deleted"], name: "field_config_deleted_idx", using: :btree
    t.index ["field_name"], name: "field_config_field_name_idx", using: :btree
    t.index ["module"], name: "field_config_module_idx", using: :btree
    t.index ["storage_active"], name: "field_config_storage_active_idx", using: :btree
    t.index ["storage_module"], name: "field_config_storage_module_idx", using: :btree
    t.index ["storage_type"], name: "field_config_storage_type_idx", using: :btree
    t.index ["type"], name: "field_config_type_idx", using: :btree
  end

  create_table "field_config_instance", force: :cascade do |t|
    t.integer "field_id",                             null: false
    t.string  "field_name",  limit: 32,  default: "", null: false
    t.string  "entity_type", limit: 32,  default: "", null: false
    t.string  "bundle",      limit: 128, default: "", null: false
    t.binary  "data",                                 null: false
    t.integer "deleted",     limit: 2,   default: 0,  null: false
    t.index ["deleted"], name: "field_config_instance_deleted_idx", using: :btree
    t.index ["field_name", "entity_type", "bundle"], name: "field_config_instance_field_name_bundle_idx", using: :btree
  end

  create_table "field_data_body", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",  limit: 128, default: "", null: false
    t.string  "bundle",       limit: 128, default: "", null: false
    t.integer "deleted",      limit: 2,   default: 0,  null: false
    t.integer "entity_id",    limit: 8,                null: false
    t.integer "revision_id",  limit: 8
    t.string  "language",     limit: 32,  default: "", null: false
    t.integer "delta",        limit: 8,                null: false
    t.text    "body_value"
    t.text    "body_summary"
    t.string  "body_format",  limit: 255
    t.index ["body_format"], name: "field_data_body_body_format_idx", using: :btree
    t.index ["bundle"], name: "field_data_body_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_body_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_body_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_body_entity_type_idx", using: :btree
    t.index ["language"], name: "field_data_body_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_body_revision_id_idx", using: :btree
  end

  create_table "field_data_comment_body", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",         limit: 128, default: "", null: false
    t.string  "bundle",              limit: 128, default: "", null: false
    t.integer "deleted",             limit: 2,   default: 0,  null: false
    t.integer "entity_id",           limit: 8,                null: false
    t.integer "revision_id",         limit: 8
    t.string  "language",            limit: 32,  default: "", null: false
    t.integer "delta",               limit: 8,                null: false
    t.text    "comment_body_value"
    t.string  "comment_body_format", limit: 255
    t.index ["bundle"], name: "field_data_comment_body_bundle_idx", using: :btree
    t.index ["comment_body_format"], name: "field_data_comment_body_comment_body_format_idx", using: :btree
    t.index ["deleted"], name: "field_data_comment_body_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_comment_body_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_comment_body_entity_type_idx", using: :btree
    t.index ["language"], name: "field_data_comment_body_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_comment_body_revision_id_idx", using: :btree
  end

  create_table "field_data_field_activitats", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                limit: 128, default: "", null: false
    t.string  "bundle",                     limit: 128, default: "", null: false
    t.integer "deleted",                    limit: 2,   default: 0,  null: false
    t.integer "entity_id",                  limit: 8,                null: false
    t.integer "revision_id",                limit: 8
    t.string  "language",                   limit: 32,  default: "", null: false
    t.integer "delta",                      limit: 8,                null: false
    t.integer "field_activitats_target_id", limit: 8,                null: false
    t.index ["bundle"], name: "field_data_field_activitats_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_activitats_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_activitats_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_activitats_entity_type_idx", using: :btree
    t.index ["field_activitats_target_id"], name: "field_data_field_activitats_field_activitats_target_id_idx", using: :btree
    t.index ["language"], name: "field_data_field_activitats_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_activitats_revision_id_idx", using: :btree
  end

  create_table "field_data_field_altres_observacions", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                      limit: 128, default: "", null: false
    t.string  "bundle",                           limit: 128, default: "", null: false
    t.integer "deleted",                          limit: 2,   default: 0,  null: false
    t.integer "entity_id",                        limit: 8,                null: false
    t.integer "revision_id",                      limit: 8
    t.string  "language",                         limit: 32,  default: "", null: false
    t.integer "delta",                            limit: 8,                null: false
    t.text    "field_altres_observacions_value"
    t.string  "field_altres_observacions_format", limit: 255
    t.index ["bundle"], name: "field_data_field_altres_observacions_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_altres_observacions_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_altres_observacions_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_altres_observacions_entity_type_idx", using: :btree
    t.index ["field_altres_observacions_format"], name: "field_data_field_altres_observacions_field_altres_observacions_", using: :btree
    t.index ["language"], name: "field_data_field_altres_observacions_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_altres_observacions_revision_id_idx", using: :btree
  end

  create_table "field_data_field_autor", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",        limit: 128, default: "", null: false
    t.string  "bundle",             limit: 128, default: "", null: false
    t.integer "deleted",            limit: 2,   default: 0,  null: false
    t.integer "entity_id",          limit: 8,                null: false
    t.integer "revision_id",        limit: 8
    t.string  "language",           limit: 32,  default: "", null: false
    t.integer "delta",              limit: 8,                null: false
    t.string  "field_autor_value",  limit: 255
    t.string  "field_autor_format", limit: 255
    t.index ["bundle"], name: "field_data_field_autor_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_autor_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_autor_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_autor_entity_type_idx", using: :btree
    t.index ["field_autor_format"], name: "field_data_field_autor_field_autor_format_idx", using: :btree
    t.index ["language"], name: "field_data_field_autor_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_autor_revision_id_idx", using: :btree
  end

  create_table "field_data_field_biografia", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",            limit: 128, default: "", null: false
    t.string  "bundle",                 limit: 128, default: "", null: false
    t.integer "deleted",                limit: 2,   default: 0,  null: false
    t.integer "entity_id",              limit: 8,                null: false
    t.integer "revision_id",            limit: 8
    t.string  "language",               limit: 32,  default: "", null: false
    t.integer "delta",                  limit: 8,                null: false
    t.text    "field_biografia_value"
    t.string  "field_biografia_format", limit: 255
    t.index ["bundle"], name: "field_data_field_biografia_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_biografia_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_biografia_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_biografia_entity_type_idx", using: :btree
    t.index ["field_biografia_format"], name: "field_data_field_biografia_field_biografia_format_idx", using: :btree
    t.index ["language"], name: "field_data_field_biografia_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_biografia_revision_id_idx", using: :btree
  end

  create_table "field_data_field_data", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string   "entity_type",      limit: 128, default: "", null: false
    t.string   "bundle",           limit: 128, default: "", null: false
    t.integer  "deleted",          limit: 2,   default: 0,  null: false
    t.integer  "entity_id",        limit: 8,                null: false
    t.integer  "revision_id",      limit: 8
    t.string   "language",         limit: 32,  default: "", null: false
    t.integer  "delta",            limit: 8,                null: false
    t.datetime "field_data_value"
    t.text     "field_data_rrule"
    t.index ["bundle"], name: "field_data_field_data_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_data_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_data_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_data_entity_type_idx", using: :btree
    t.index ["language"], name: "field_data_field_data_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_data_revision_id_idx", using: :btree
  end

  create_table "field_data_field_dates", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string   "entity_type",        limit: 128, default: "", null: false
    t.string   "bundle",             limit: 128, default: "", null: false
    t.integer  "deleted",            limit: 2,   default: 0,  null: false
    t.integer  "entity_id",          limit: 8,                null: false
    t.integer  "revision_id",        limit: 8
    t.string   "language",           limit: 32,  default: "", null: false
    t.integer  "delta",              limit: 8,                null: false
    t.datetime "field_dates_value"
    t.datetime "field_dates_value2"
    t.index ["bundle"], name: "field_data_field_dates_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_dates_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_dates_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_dates_entity_type_idx", using: :btree
    t.index ["language"], name: "field_data_field_dates_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_dates_revision_id_idx", using: :btree
  end

  create_table "field_data_field_document", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                limit: 128, default: "", null: false
    t.string  "bundle",                     limit: 128, default: "", null: false
    t.integer "deleted",                    limit: 2,   default: 0,  null: false
    t.integer "entity_id",                  limit: 8,                null: false
    t.integer "revision_id",                limit: 8
    t.string  "language",                   limit: 32,  default: "", null: false
    t.integer "delta",                      limit: 8,                null: false
    t.integer "field_document_fid",         limit: 8
    t.integer "field_document_display",                 default: 1,  null: false
    t.text    "field_document_description"
    t.index ["bundle"], name: "field_data_field_document_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_document_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_document_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_document_entity_type_idx", using: :btree
    t.index ["field_document_fid"], name: "field_data_field_document_field_document_fid_idx", using: :btree
    t.index ["language"], name: "field_data_field_document_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_document_revision_id_idx", using: :btree
  end

  create_table "field_data_field_entitat_seccio", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                    limit: 128, default: "", null: false
    t.string  "bundle",                         limit: 128, default: "", null: false
    t.integer "deleted",                        limit: 2,   default: 0,  null: false
    t.integer "entity_id",                      limit: 8,                null: false
    t.integer "revision_id",                    limit: 8
    t.string  "language",                       limit: 32,  default: "", null: false
    t.integer "delta",                          limit: 8,                null: false
    t.integer "field_entitat_seccio_target_id", limit: 8,                null: false
    t.index ["bundle"], name: "field_data_field_entitat_seccio_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_entitat_seccio_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_entitat_seccio_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_entitat_seccio_entity_type_idx", using: :btree
    t.index ["field_entitat_seccio_target_id"], name: "field_data_field_entitat_seccio_field_entitat_seccio_target_id_", using: :btree
    t.index ["language"], name: "field_data_field_entitat_seccio_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_entitat_seccio_revision_id_idx", using: :btree
  end

  create_table "field_data_field_espai", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",     limit: 128, default: "", null: false
    t.string  "bundle",          limit: 128, default: "", null: false
    t.integer "deleted",         limit: 2,   default: 0,  null: false
    t.integer "entity_id",       limit: 8,                null: false
    t.integer "revision_id",     limit: 8
    t.string  "language",        limit: 32,  default: "", null: false
    t.integer "delta",           limit: 8,                null: false
    t.integer "field_espai_tid", limit: 8
    t.index ["bundle"], name: "field_data_field_espai_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_espai_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_espai_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_espai_entity_type_idx", using: :btree
    t.index ["field_espai_tid"], name: "field_data_field_espai_field_espai_tid_idx", using: :btree
    t.index ["language"], name: "field_data_field_espai_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_espai_revision_id_idx", using: :btree
  end

  create_table "field_data_field_file_image_alt_text", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                      limit: 128, default: "", null: false
    t.string  "bundle",                           limit: 128, default: "", null: false
    t.integer "deleted",                          limit: 2,   default: 0,  null: false
    t.integer "entity_id",                        limit: 8,                null: false
    t.integer "revision_id",                      limit: 8
    t.string  "language",                         limit: 32,  default: "", null: false
    t.integer "delta",                            limit: 8,                null: false
    t.string  "field_file_image_alt_text_value",  limit: 255
    t.string  "field_file_image_alt_text_format", limit: 255
    t.index ["bundle"], name: "field_data_field_file_image_alt_text_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_file_image_alt_text_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_file_image_alt_text_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_file_image_alt_text_entity_type_idx", using: :btree
    t.index ["field_file_image_alt_text_format"], name: "field_data_field_file_image_alt_text_field_file_image_alt_text_", using: :btree
    t.index ["language"], name: "field_data_field_file_image_alt_text_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_file_image_alt_text_revision_id_idx", using: :btree
  end

  create_table "field_data_field_file_image_title_text", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                        limit: 128, default: "", null: false
    t.string  "bundle",                             limit: 128, default: "", null: false
    t.integer "deleted",                            limit: 2,   default: 0,  null: false
    t.integer "entity_id",                          limit: 8,                null: false
    t.integer "revision_id",                        limit: 8
    t.string  "language",                           limit: 32,  default: "", null: false
    t.integer "delta",                              limit: 8,                null: false
    t.string  "field_file_image_title_text_value",  limit: 255
    t.string  "field_file_image_title_text_format", limit: 255
    t.index ["bundle"], name: "field_data_field_file_image_title_text_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_file_image_title_text_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_file_image_title_text_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_file_image_title_text_entity_type_idx", using: :btree
    t.index ["field_file_image_title_text_format"], name: "field_data_field_file_image_title_text_field_file_image_title_t", using: :btree
    t.index ["language"], name: "field_data_field_file_image_title_text_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_file_image_title_text_revision_id_idx", using: :btree
  end

  create_table "field_data_field_folder", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",      limit: 128, default: "", null: false
    t.string  "bundle",           limit: 128, default: "", null: false
    t.integer "deleted",          limit: 2,   default: 0,  null: false
    t.integer "entity_id",        limit: 8,                null: false
    t.integer "revision_id",      limit: 8
    t.string  "language",         limit: 32,  default: "", null: false
    t.integer "delta",            limit: 8,                null: false
    t.integer "field_folder_tid", limit: 8
    t.index ["bundle"], name: "field_data_field_folder_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_folder_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_folder_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_folder_entity_type_idx", using: :btree
    t.index ["field_folder_tid"], name: "field_data_field_folder_field_folder_tid_idx", using: :btree
    t.index ["language"], name: "field_data_field_folder_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_folder_revision_id_idx", using: :btree
  end

  create_table "field_data_field_image", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",        limit: 128,  default: "", null: false
    t.string  "bundle",             limit: 128,  default: "", null: false
    t.integer "deleted",            limit: 2,    default: 0,  null: false
    t.integer "entity_id",          limit: 8,                 null: false
    t.integer "revision_id",        limit: 8
    t.string  "language",           limit: 32,   default: "", null: false
    t.integer "delta",              limit: 8,                 null: false
    t.integer "field_image_fid",    limit: 8
    t.string  "field_image_alt",    limit: 512
    t.string  "field_image_title",  limit: 1024
    t.integer "field_image_width",  limit: 8
    t.integer "field_image_height", limit: 8
    t.index ["bundle"], name: "field_data_field_image_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_image_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_image_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_image_entity_type_idx", using: :btree
    t.index ["field_image_fid"], name: "field_data_field_image_field_image_fid_idx", using: :btree
    t.index ["language"], name: "field_data_field_image_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_image_revision_id_idx", using: :btree
  end

  create_table "field_data_field_media_file_tags", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",               limit: 128, default: "", null: false
    t.string  "bundle",                    limit: 128, default: "", null: false
    t.integer "deleted",                   limit: 2,   default: 0,  null: false
    t.integer "entity_id",                 limit: 8,                null: false
    t.integer "revision_id",               limit: 8
    t.string  "language",                  limit: 32,  default: "", null: false
    t.integer "delta",                     limit: 8,                null: false
    t.integer "field_media_file_tags_tid", limit: 8
    t.index ["bundle"], name: "field_data_field_media_file_tags_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_media_file_tags_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_media_file_tags_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_media_file_tags_entity_type_idx", using: :btree
    t.index ["field_media_file_tags_tid"], name: "field_data_field_media_file_tags_field_media_file_tags_tid_idx", using: :btree
    t.index ["language"], name: "field_data_field_media_file_tags_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_media_file_tags_revision_id_idx", using: :btree
  end

  create_table "field_data_field_nom", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",      limit: 128, default: "", null: false
    t.string  "bundle",           limit: 128, default: "", null: false
    t.integer "deleted",          limit: 2,   default: 0,  null: false
    t.integer "entity_id",        limit: 8,                null: false
    t.integer "revision_id",      limit: 8
    t.string  "language",         limit: 32,  default: "", null: false
    t.integer "delta",            limit: 8,                null: false
    t.string  "field_nom_value",  limit: 255
    t.string  "field_nom_format", limit: 255
    t.index ["bundle"], name: "field_data_field_nom_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_nom_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_nom_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_nom_entity_type_idx", using: :btree
    t.index ["field_nom_format"], name: "field_data_field_nom_field_nom_format_idx", using: :btree
    t.index ["language"], name: "field_data_field_nom_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_nom_revision_id_idx", using: :btree
  end

  create_table "field_data_field_noticies", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",              limit: 128, default: "", null: false
    t.string  "bundle",                   limit: 128, default: "", null: false
    t.integer "deleted",                  limit: 2,   default: 0,  null: false
    t.integer "entity_id",                limit: 8,                null: false
    t.integer "revision_id",              limit: 8
    t.string  "language",                 limit: 32,  default: "", null: false
    t.integer "delta",                    limit: 8,                null: false
    t.integer "field_noticies_target_id", limit: 8,                null: false
    t.index ["bundle"], name: "field_data_field_noticies_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_noticies_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_noticies_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_noticies_entity_type_idx", using: :btree
    t.index ["field_noticies_target_id"], name: "field_data_field_noticies_field_noticies_target_id_idx", using: :btree
    t.index ["language"], name: "field_data_field_noticies_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_noticies_revision_id_idx", using: :btree
  end

  create_table "field_data_field_postres", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",          limit: 128, default: "", null: false
    t.string  "bundle",               limit: 128, default: "", null: false
    t.integer "deleted",              limit: 2,   default: 0,  null: false
    t.integer "entity_id",            limit: 8,                null: false
    t.integer "revision_id",          limit: 8
    t.string  "language",             limit: 32,  default: "", null: false
    t.integer "delta",                limit: 8,                null: false
    t.string  "field_postres_value",  limit: 255
    t.string  "field_postres_format", limit: 255
    t.index ["bundle"], name: "field_data_field_postres_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_postres_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_postres_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_postres_entity_type_idx", using: :btree
    t.index ["field_postres_format"], name: "field_data_field_postres_field_postres_format_idx", using: :btree
    t.index ["language"], name: "field_data_field_postres_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_postres_revision_id_idx", using: :btree
  end

  create_table "field_data_field_primer_cognom", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                limit: 128, default: "", null: false
    t.string  "bundle",                     limit: 128, default: "", null: false
    t.integer "deleted",                    limit: 2,   default: 0,  null: false
    t.integer "entity_id",                  limit: 8,                null: false
    t.integer "revision_id",                limit: 8
    t.string  "language",                   limit: 32,  default: "", null: false
    t.integer "delta",                      limit: 8,                null: false
    t.string  "field_primer_cognom_value",  limit: 255
    t.string  "field_primer_cognom_format", limit: 255
    t.index ["bundle"], name: "field_data_field_primer_cognom_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_primer_cognom_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_primer_cognom_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_primer_cognom_entity_type_idx", using: :btree
    t.index ["field_primer_cognom_format"], name: "field_data_field_primer_cognom_field_primer_cognom_format_idx", using: :btree
    t.index ["language"], name: "field_data_field_primer_cognom_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_primer_cognom_revision_id_idx", using: :btree
  end

  create_table "field_data_field_primers", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",          limit: 128, default: "", null: false
    t.string  "bundle",               limit: 128, default: "", null: false
    t.integer "deleted",              limit: 2,   default: 0,  null: false
    t.integer "entity_id",            limit: 8,                null: false
    t.integer "revision_id",          limit: 8
    t.string  "language",             limit: 32,  default: "", null: false
    t.integer "delta",                limit: 8,                null: false
    t.string  "field_primers_value",  limit: 255
    t.string  "field_primers_format", limit: 255
    t.index ["bundle"], name: "field_data_field_primers_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_primers_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_primers_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_primers_entity_type_idx", using: :btree
    t.index ["field_primers_format"], name: "field_data_field_primers_field_primers_format_idx", using: :btree
    t.index ["language"], name: "field_data_field_primers_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_primers_revision_id_idx", using: :btree
  end

  create_table "field_data_field_puntual_periodica", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                   limit: 128, default: "", null: false
    t.string  "bundle",                        limit: 128, default: "", null: false
    t.integer "deleted",                       limit: 2,   default: 0,  null: false
    t.integer "entity_id",                     limit: 8,                null: false
    t.integer "revision_id",                   limit: 8
    t.string  "language",                      limit: 32,  default: "", null: false
    t.integer "delta",                         limit: 8,                null: false
    t.string  "field_puntual_periodica_value", limit: 255
    t.index ["bundle"], name: "field_data_field_puntual_periodica_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_puntual_periodica_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_puntual_periodica_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_puntual_periodica_entity_type_idx", using: :btree
    t.index ["field_puntual_periodica_value"], name: "field_data_field_puntual_periodica_field_puntual_periodica_valu", using: :btree
    t.index ["language"], name: "field_data_field_puntual_periodica_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_puntual_periodica_revision_id_idx", using: :btree
  end

  create_table "field_data_field_segon_cognom", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",               limit: 128, default: "", null: false
    t.string  "bundle",                    limit: 128, default: "", null: false
    t.integer "deleted",                   limit: 2,   default: 0,  null: false
    t.integer "entity_id",                 limit: 8,                null: false
    t.integer "revision_id",               limit: 8
    t.string  "language",                  limit: 32,  default: "", null: false
    t.integer "delta",                     limit: 8,                null: false
    t.string  "field_segon_cognom_value",  limit: 255
    t.string  "field_segon_cognom_format", limit: 255
    t.index ["bundle"], name: "field_data_field_segon_cognom_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_segon_cognom_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_segon_cognom_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_segon_cognom_entity_type_idx", using: :btree
    t.index ["field_segon_cognom_format"], name: "field_data_field_segon_cognom_field_segon_cognom_format_idx", using: :btree
    t.index ["language"], name: "field_data_field_segon_cognom_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_segon_cognom_revision_id_idx", using: :btree
  end

  create_table "field_data_field_segons", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",         limit: 128, default: "", null: false
    t.string  "bundle",              limit: 128, default: "", null: false
    t.integer "deleted",             limit: 2,   default: 0,  null: false
    t.integer "entity_id",           limit: 8,                null: false
    t.integer "revision_id",         limit: 8
    t.string  "language",            limit: 32,  default: "", null: false
    t.integer "delta",               limit: 8,                null: false
    t.string  "field_segons_value",  limit: 255
    t.string  "field_segons_format", limit: 255
    t.index ["bundle"], name: "field_data_field_segons_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_segons_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_segons_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_segons_entity_type_idx", using: :btree
    t.index ["field_segons_format"], name: "field_data_field_segons_field_segons_format_idx", using: :btree
    t.index ["language"], name: "field_data_field_segons_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_segons_revision_id_idx", using: :btree
  end

  create_table "field_data_field_simplenews_term", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",               limit: 128, default: "", null: false
    t.string  "bundle",                    limit: 128, default: "", null: false
    t.integer "deleted",                   limit: 2,   default: 0,  null: false
    t.integer "entity_id",                 limit: 8,                null: false
    t.integer "revision_id",               limit: 8
    t.string  "language",                  limit: 32,  default: "", null: false
    t.integer "delta",                     limit: 8,                null: false
    t.integer "field_simplenews_term_tid", limit: 8
    t.index ["bundle"], name: "field_data_field_simplenews_term_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_simplenews_term_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_simplenews_term_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_simplenews_term_entity_type_idx", using: :btree
    t.index ["field_simplenews_term_tid"], name: "field_data_field_simplenews_term_field_simplenews_term_tid_idx", using: :btree
    t.index ["language"], name: "field_data_field_simplenews_term_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_simplenews_term_revision_id_idx", using: :btree
  end

  create_table "field_data_field_tags", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",    limit: 128, default: "", null: false
    t.string  "bundle",         limit: 128, default: "", null: false
    t.integer "deleted",        limit: 2,   default: 0,  null: false
    t.integer "entity_id",      limit: 8,                null: false
    t.integer "revision_id",    limit: 8
    t.string  "language",       limit: 32,  default: "", null: false
    t.integer "delta",          limit: 8,                null: false
    t.integer "field_tags_tid", limit: 8
    t.index ["bundle"], name: "field_data_field_tags_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_tags_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_tags_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_tags_entity_type_idx", using: :btree
    t.index ["field_tags_tid"], name: "field_data_field_tags_field_tags_tid_idx", using: :btree
    t.index ["language"], name: "field_data_field_tags_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_tags_revision_id_idx", using: :btree
  end

  create_table "field_data_field_taller_cicle", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                  limit: 128, default: "", null: false
    t.string  "bundle",                       limit: 128, default: "", null: false
    t.integer "deleted",                      limit: 2,   default: 0,  null: false
    t.integer "entity_id",                    limit: 8,                null: false
    t.integer "revision_id",                  limit: 8
    t.string  "language",                     limit: 32,  default: "", null: false
    t.integer "delta",                        limit: 8,                null: false
    t.integer "field_taller_cicle_target_id", limit: 8,                null: false
    t.index ["bundle"], name: "field_data_field_taller_cicle_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_taller_cicle_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_taller_cicle_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_taller_cicle_entity_type_idx", using: :btree
    t.index ["field_taller_cicle_target_id"], name: "field_data_field_taller_cicle_field_taller_cicle_target_id_idx", using: :btree
    t.index ["language"], name: "field_data_field_taller_cicle_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_taller_cicle_revision_id_idx", using: :btree
  end

  create_table "field_data_field_telefon", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",          limit: 128, default: "", null: false
    t.string  "bundle",               limit: 128, default: "", null: false
    t.integer "deleted",              limit: 2,   default: 0,  null: false
    t.integer "entity_id",            limit: 8,                null: false
    t.integer "revision_id",          limit: 8
    t.string  "language",             limit: 32,  default: "", null: false
    t.integer "delta",                limit: 8,                null: false
    t.string  "field_telefon_value",  limit: 255
    t.string  "field_telefon_format", limit: 255
    t.index ["bundle"], name: "field_data_field_telefon_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_telefon_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_telefon_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_telefon_entity_type_idx", using: :btree
    t.index ["field_telefon_format"], name: "field_data_field_telefon_field_telefon_format_idx", using: :btree
    t.index ["language"], name: "field_data_field_telefon_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_telefon_revision_id_idx", using: :btree
  end

  create_table "field_data_field_tipus_seccio_entitat", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                      limit: 128, default: "", null: false
    t.string  "bundle",                           limit: 128, default: "", null: false
    t.integer "deleted",                          limit: 2,   default: 0,  null: false
    t.integer "entity_id",                        limit: 8,                null: false
    t.integer "revision_id",                      limit: 8
    t.string  "language",                         limit: 32,  default: "", null: false
    t.integer "delta",                            limit: 8,                null: false
    t.string  "field_tipus_seccio_entitat_value", limit: 255
    t.index ["bundle"], name: "field_data_field_tipus_seccio_entitat_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_tipus_seccio_entitat_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_tipus_seccio_entitat_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_tipus_seccio_entitat_entity_type_idx", using: :btree
    t.index ["field_tipus_seccio_entitat_value"], name: "field_data_field_tipus_seccio_entitat_field_tipus_seccio_entita", using: :btree
    t.index ["language"], name: "field_data_field_tipus_seccio_entitat_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_tipus_seccio_entitat_revision_id_idx", using: :btree
  end

  create_table "field_data_field_tipus_taller_cicle", primary_key: ["entity_type", "entity_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                    limit: 128, default: "", null: false
    t.string  "bundle",                         limit: 128, default: "", null: false
    t.integer "deleted",                        limit: 2,   default: 0,  null: false
    t.integer "entity_id",                      limit: 8,                null: false
    t.integer "revision_id",                    limit: 8
    t.string  "language",                       limit: 32,  default: "", null: false
    t.integer "delta",                          limit: 8,                null: false
    t.string  "field_tipus_taller_cicle_value", limit: 255
    t.index ["bundle"], name: "field_data_field_tipus_taller_cicle_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_data_field_tipus_taller_cicle_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_data_field_tipus_taller_cicle_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_data_field_tipus_taller_cicle_entity_type_idx", using: :btree
    t.index ["field_tipus_taller_cicle_value"], name: "field_data_field_tipus_taller_cicle_field_tipus_taller_cicle_va", using: :btree
    t.index ["language"], name: "field_data_field_tipus_taller_cicle_language_idx", using: :btree
    t.index ["revision_id"], name: "field_data_field_tipus_taller_cicle_revision_id_idx", using: :btree
  end

  create_table "field_revision_body", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",  limit: 128, default: "", null: false
    t.string  "bundle",       limit: 128, default: "", null: false
    t.integer "deleted",      limit: 2,   default: 0,  null: false
    t.integer "entity_id",    limit: 8,                null: false
    t.integer "revision_id",  limit: 8,                null: false
    t.string  "language",     limit: 32,  default: "", null: false
    t.integer "delta",        limit: 8,                null: false
    t.text    "body_value"
    t.text    "body_summary"
    t.string  "body_format",  limit: 255
    t.index ["body_format"], name: "field_revision_body_body_format_idx", using: :btree
    t.index ["bundle"], name: "field_revision_body_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_body_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_body_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_body_entity_type_idx", using: :btree
    t.index ["language"], name: "field_revision_body_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_body_revision_id_idx", using: :btree
  end

  create_table "field_revision_comment_body", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",         limit: 128, default: "", null: false
    t.string  "bundle",              limit: 128, default: "", null: false
    t.integer "deleted",             limit: 2,   default: 0,  null: false
    t.integer "entity_id",           limit: 8,                null: false
    t.integer "revision_id",         limit: 8,                null: false
    t.string  "language",            limit: 32,  default: "", null: false
    t.integer "delta",               limit: 8,                null: false
    t.text    "comment_body_value"
    t.string  "comment_body_format", limit: 255
    t.index ["bundle"], name: "field_revision_comment_body_bundle_idx", using: :btree
    t.index ["comment_body_format"], name: "field_revision_comment_body_comment_body_format_idx", using: :btree
    t.index ["deleted"], name: "field_revision_comment_body_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_comment_body_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_comment_body_entity_type_idx", using: :btree
    t.index ["language"], name: "field_revision_comment_body_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_comment_body_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_activitats", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                limit: 128, default: "", null: false
    t.string  "bundle",                     limit: 128, default: "", null: false
    t.integer "deleted",                    limit: 2,   default: 0,  null: false
    t.integer "entity_id",                  limit: 8,                null: false
    t.integer "revision_id",                limit: 8,                null: false
    t.string  "language",                   limit: 32,  default: "", null: false
    t.integer "delta",                      limit: 8,                null: false
    t.integer "field_activitats_target_id", limit: 8,                null: false
    t.index ["bundle"], name: "field_revision_field_activitats_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_activitats_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_activitats_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_activitats_entity_type_idx", using: :btree
    t.index ["field_activitats_target_id"], name: "field_revision_field_activitats_field_activitats_target_id_idx", using: :btree
    t.index ["language"], name: "field_revision_field_activitats_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_activitats_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_altres_observacions", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                      limit: 128, default: "", null: false
    t.string  "bundle",                           limit: 128, default: "", null: false
    t.integer "deleted",                          limit: 2,   default: 0,  null: false
    t.integer "entity_id",                        limit: 8,                null: false
    t.integer "revision_id",                      limit: 8,                null: false
    t.string  "language",                         limit: 32,  default: "", null: false
    t.integer "delta",                            limit: 8,                null: false
    t.text    "field_altres_observacions_value"
    t.string  "field_altres_observacions_format", limit: 255
    t.index ["bundle"], name: "field_revision_field_altres_observacions_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_altres_observacions_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_altres_observacions_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_altres_observacions_entity_type_idx", using: :btree
    t.index ["field_altres_observacions_format"], name: "field_revision_field_altres_observacions_field_altres_observaci", using: :btree
    t.index ["language"], name: "field_revision_field_altres_observacions_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_altres_observacions_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_autor", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",        limit: 128, default: "", null: false
    t.string  "bundle",             limit: 128, default: "", null: false
    t.integer "deleted",            limit: 2,   default: 0,  null: false
    t.integer "entity_id",          limit: 8,                null: false
    t.integer "revision_id",        limit: 8,                null: false
    t.string  "language",           limit: 32,  default: "", null: false
    t.integer "delta",              limit: 8,                null: false
    t.string  "field_autor_value",  limit: 255
    t.string  "field_autor_format", limit: 255
    t.index ["bundle"], name: "field_revision_field_autor_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_autor_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_autor_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_autor_entity_type_idx", using: :btree
    t.index ["field_autor_format"], name: "field_revision_field_autor_field_autor_format_idx", using: :btree
    t.index ["language"], name: "field_revision_field_autor_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_autor_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_biografia", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",            limit: 128, default: "", null: false
    t.string  "bundle",                 limit: 128, default: "", null: false
    t.integer "deleted",                limit: 2,   default: 0,  null: false
    t.integer "entity_id",              limit: 8,                null: false
    t.integer "revision_id",            limit: 8,                null: false
    t.string  "language",               limit: 32,  default: "", null: false
    t.integer "delta",                  limit: 8,                null: false
    t.text    "field_biografia_value"
    t.string  "field_biografia_format", limit: 255
    t.index ["bundle"], name: "field_revision_field_biografia_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_biografia_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_biografia_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_biografia_entity_type_idx", using: :btree
    t.index ["field_biografia_format"], name: "field_revision_field_biografia_field_biografia_format_idx", using: :btree
    t.index ["language"], name: "field_revision_field_biografia_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_biografia_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_data", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string   "entity_type",      limit: 128, default: "", null: false
    t.string   "bundle",           limit: 128, default: "", null: false
    t.integer  "deleted",          limit: 2,   default: 0,  null: false
    t.integer  "entity_id",        limit: 8,                null: false
    t.integer  "revision_id",      limit: 8,                null: false
    t.string   "language",         limit: 32,  default: "", null: false
    t.integer  "delta",            limit: 8,                null: false
    t.datetime "field_data_value"
    t.text     "field_data_rrule"
    t.index ["bundle"], name: "field_revision_field_data_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_data_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_data_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_data_entity_type_idx", using: :btree
    t.index ["language"], name: "field_revision_field_data_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_data_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_dates", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string   "entity_type",        limit: 128, default: "", null: false
    t.string   "bundle",             limit: 128, default: "", null: false
    t.integer  "deleted",            limit: 2,   default: 0,  null: false
    t.integer  "entity_id",          limit: 8,                null: false
    t.integer  "revision_id",        limit: 8,                null: false
    t.string   "language",           limit: 32,  default: "", null: false
    t.integer  "delta",              limit: 8,                null: false
    t.datetime "field_dates_value"
    t.datetime "field_dates_value2"
    t.index ["bundle"], name: "field_revision_field_dates_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_dates_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_dates_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_dates_entity_type_idx", using: :btree
    t.index ["language"], name: "field_revision_field_dates_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_dates_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_document", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                limit: 128, default: "", null: false
    t.string  "bundle",                     limit: 128, default: "", null: false
    t.integer "deleted",                    limit: 2,   default: 0,  null: false
    t.integer "entity_id",                  limit: 8,                null: false
    t.integer "revision_id",                limit: 8,                null: false
    t.string  "language",                   limit: 32,  default: "", null: false
    t.integer "delta",                      limit: 8,                null: false
    t.integer "field_document_fid",         limit: 8
    t.integer "field_document_display",                 default: 1,  null: false
    t.text    "field_document_description"
    t.index ["bundle"], name: "field_revision_field_document_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_document_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_document_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_document_entity_type_idx", using: :btree
    t.index ["field_document_fid"], name: "field_revision_field_document_field_document_fid_idx", using: :btree
    t.index ["language"], name: "field_revision_field_document_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_document_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_entitat_seccio", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                    limit: 128, default: "", null: false
    t.string  "bundle",                         limit: 128, default: "", null: false
    t.integer "deleted",                        limit: 2,   default: 0,  null: false
    t.integer "entity_id",                      limit: 8,                null: false
    t.integer "revision_id",                    limit: 8,                null: false
    t.string  "language",                       limit: 32,  default: "", null: false
    t.integer "delta",                          limit: 8,                null: false
    t.integer "field_entitat_seccio_target_id", limit: 8,                null: false
    t.index ["bundle"], name: "field_revision_field_entitat_seccio_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_entitat_seccio_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_entitat_seccio_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_entitat_seccio_entity_type_idx", using: :btree
    t.index ["field_entitat_seccio_target_id"], name: "field_revision_field_entitat_seccio_field_entitat_seccio_target", using: :btree
    t.index ["language"], name: "field_revision_field_entitat_seccio_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_entitat_seccio_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_espai", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",     limit: 128, default: "", null: false
    t.string  "bundle",          limit: 128, default: "", null: false
    t.integer "deleted",         limit: 2,   default: 0,  null: false
    t.integer "entity_id",       limit: 8,                null: false
    t.integer "revision_id",     limit: 8,                null: false
    t.string  "language",        limit: 32,  default: "", null: false
    t.integer "delta",           limit: 8,                null: false
    t.integer "field_espai_tid", limit: 8
    t.index ["bundle"], name: "field_revision_field_espai_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_espai_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_espai_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_espai_entity_type_idx", using: :btree
    t.index ["field_espai_tid"], name: "field_revision_field_espai_field_espai_tid_idx", using: :btree
    t.index ["language"], name: "field_revision_field_espai_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_espai_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_file_image_alt_text", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                      limit: 128, default: "", null: false
    t.string  "bundle",                           limit: 128, default: "", null: false
    t.integer "deleted",                          limit: 2,   default: 0,  null: false
    t.integer "entity_id",                        limit: 8,                null: false
    t.integer "revision_id",                      limit: 8,                null: false
    t.string  "language",                         limit: 32,  default: "", null: false
    t.integer "delta",                            limit: 8,                null: false
    t.string  "field_file_image_alt_text_value",  limit: 255
    t.string  "field_file_image_alt_text_format", limit: 255
    t.index ["bundle"], name: "field_revision_field_file_image_alt_text_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_file_image_alt_text_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_file_image_alt_text_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_file_image_alt_text_entity_type_idx", using: :btree
    t.index ["field_file_image_alt_text_format"], name: "field_revision_field_file_image_alt_text_field_file_image_alt_t", using: :btree
    t.index ["language"], name: "field_revision_field_file_image_alt_text_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_file_image_alt_text_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_file_image_title_text", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                        limit: 128, default: "", null: false
    t.string  "bundle",                             limit: 128, default: "", null: false
    t.integer "deleted",                            limit: 2,   default: 0,  null: false
    t.integer "entity_id",                          limit: 8,                null: false
    t.integer "revision_id",                        limit: 8,                null: false
    t.string  "language",                           limit: 32,  default: "", null: false
    t.integer "delta",                              limit: 8,                null: false
    t.string  "field_file_image_title_text_value",  limit: 255
    t.string  "field_file_image_title_text_format", limit: 255
    t.index ["bundle"], name: "field_revision_field_file_image_title_text_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_file_image_title_text_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_file_image_title_text_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_file_image_title_text_entity_type_idx", using: :btree
    t.index ["field_file_image_title_text_format"], name: "field_revision_field_file_image_title_text_field_file_image_tit", using: :btree
    t.index ["language"], name: "field_revision_field_file_image_title_text_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_file_image_title_text_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_folder", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",      limit: 128, default: "", null: false
    t.string  "bundle",           limit: 128, default: "", null: false
    t.integer "deleted",          limit: 2,   default: 0,  null: false
    t.integer "entity_id",        limit: 8,                null: false
    t.integer "revision_id",      limit: 8,                null: false
    t.string  "language",         limit: 32,  default: "", null: false
    t.integer "delta",            limit: 8,                null: false
    t.integer "field_folder_tid", limit: 8
    t.index ["bundle"], name: "field_revision_field_folder_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_folder_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_folder_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_folder_entity_type_idx", using: :btree
    t.index ["field_folder_tid"], name: "field_revision_field_folder_field_folder_tid_idx", using: :btree
    t.index ["language"], name: "field_revision_field_folder_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_folder_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_image", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",        limit: 128,  default: "", null: false
    t.string  "bundle",             limit: 128,  default: "", null: false
    t.integer "deleted",            limit: 2,    default: 0,  null: false
    t.integer "entity_id",          limit: 8,                 null: false
    t.integer "revision_id",        limit: 8,                 null: false
    t.string  "language",           limit: 32,   default: "", null: false
    t.integer "delta",              limit: 8,                 null: false
    t.integer "field_image_fid",    limit: 8
    t.string  "field_image_alt",    limit: 512
    t.string  "field_image_title",  limit: 1024
    t.integer "field_image_width",  limit: 8
    t.integer "field_image_height", limit: 8
    t.index ["bundle"], name: "field_revision_field_image_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_image_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_image_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_image_entity_type_idx", using: :btree
    t.index ["field_image_fid"], name: "field_revision_field_image_field_image_fid_idx", using: :btree
    t.index ["language"], name: "field_revision_field_image_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_image_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_media_file_tags", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",               limit: 128, default: "", null: false
    t.string  "bundle",                    limit: 128, default: "", null: false
    t.integer "deleted",                   limit: 2,   default: 0,  null: false
    t.integer "entity_id",                 limit: 8,                null: false
    t.integer "revision_id",               limit: 8,                null: false
    t.string  "language",                  limit: 32,  default: "", null: false
    t.integer "delta",                     limit: 8,                null: false
    t.integer "field_media_file_tags_tid", limit: 8
    t.index ["bundle"], name: "field_revision_field_media_file_tags_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_media_file_tags_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_media_file_tags_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_media_file_tags_entity_type_idx", using: :btree
    t.index ["field_media_file_tags_tid"], name: "field_revision_field_media_file_tags_field_media_file_tags_tid_", using: :btree
    t.index ["language"], name: "field_revision_field_media_file_tags_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_media_file_tags_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_nom", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",      limit: 128, default: "", null: false
    t.string  "bundle",           limit: 128, default: "", null: false
    t.integer "deleted",          limit: 2,   default: 0,  null: false
    t.integer "entity_id",        limit: 8,                null: false
    t.integer "revision_id",      limit: 8,                null: false
    t.string  "language",         limit: 32,  default: "", null: false
    t.integer "delta",            limit: 8,                null: false
    t.string  "field_nom_value",  limit: 255
    t.string  "field_nom_format", limit: 255
    t.index ["bundle"], name: "field_revision_field_nom_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_nom_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_nom_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_nom_entity_type_idx", using: :btree
    t.index ["field_nom_format"], name: "field_revision_field_nom_field_nom_format_idx", using: :btree
    t.index ["language"], name: "field_revision_field_nom_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_nom_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_noticies", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",              limit: 128, default: "", null: false
    t.string  "bundle",                   limit: 128, default: "", null: false
    t.integer "deleted",                  limit: 2,   default: 0,  null: false
    t.integer "entity_id",                limit: 8,                null: false
    t.integer "revision_id",              limit: 8,                null: false
    t.string  "language",                 limit: 32,  default: "", null: false
    t.integer "delta",                    limit: 8,                null: false
    t.integer "field_noticies_target_id", limit: 8,                null: false
    t.index ["bundle"], name: "field_revision_field_noticies_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_noticies_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_noticies_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_noticies_entity_type_idx", using: :btree
    t.index ["field_noticies_target_id"], name: "field_revision_field_noticies_field_noticies_target_id_idx", using: :btree
    t.index ["language"], name: "field_revision_field_noticies_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_noticies_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_postres", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",          limit: 128, default: "", null: false
    t.string  "bundle",               limit: 128, default: "", null: false
    t.integer "deleted",              limit: 2,   default: 0,  null: false
    t.integer "entity_id",            limit: 8,                null: false
    t.integer "revision_id",          limit: 8,                null: false
    t.string  "language",             limit: 32,  default: "", null: false
    t.integer "delta",                limit: 8,                null: false
    t.string  "field_postres_value",  limit: 255
    t.string  "field_postres_format", limit: 255
    t.index ["bundle"], name: "field_revision_field_postres_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_postres_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_postres_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_postres_entity_type_idx", using: :btree
    t.index ["field_postres_format"], name: "field_revision_field_postres_field_postres_format_idx", using: :btree
    t.index ["language"], name: "field_revision_field_postres_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_postres_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_primer_cognom", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                limit: 128, default: "", null: false
    t.string  "bundle",                     limit: 128, default: "", null: false
    t.integer "deleted",                    limit: 2,   default: 0,  null: false
    t.integer "entity_id",                  limit: 8,                null: false
    t.integer "revision_id",                limit: 8,                null: false
    t.string  "language",                   limit: 32,  default: "", null: false
    t.integer "delta",                      limit: 8,                null: false
    t.string  "field_primer_cognom_value",  limit: 255
    t.string  "field_primer_cognom_format", limit: 255
    t.index ["bundle"], name: "field_revision_field_primer_cognom_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_primer_cognom_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_primer_cognom_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_primer_cognom_entity_type_idx", using: :btree
    t.index ["field_primer_cognom_format"], name: "field_revision_field_primer_cognom_field_primer_cognom_format_i", using: :btree
    t.index ["language"], name: "field_revision_field_primer_cognom_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_primer_cognom_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_primers", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",          limit: 128, default: "", null: false
    t.string  "bundle",               limit: 128, default: "", null: false
    t.integer "deleted",              limit: 2,   default: 0,  null: false
    t.integer "entity_id",            limit: 8,                null: false
    t.integer "revision_id",          limit: 8,                null: false
    t.string  "language",             limit: 32,  default: "", null: false
    t.integer "delta",                limit: 8,                null: false
    t.string  "field_primers_value",  limit: 255
    t.string  "field_primers_format", limit: 255
    t.index ["bundle"], name: "field_revision_field_primers_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_primers_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_primers_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_primers_entity_type_idx", using: :btree
    t.index ["field_primers_format"], name: "field_revision_field_primers_field_primers_format_idx", using: :btree
    t.index ["language"], name: "field_revision_field_primers_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_primers_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_puntual_periodica", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                   limit: 128, default: "", null: false
    t.string  "bundle",                        limit: 128, default: "", null: false
    t.integer "deleted",                       limit: 2,   default: 0,  null: false
    t.integer "entity_id",                     limit: 8,                null: false
    t.integer "revision_id",                   limit: 8,                null: false
    t.string  "language",                      limit: 32,  default: "", null: false
    t.integer "delta",                         limit: 8,                null: false
    t.string  "field_puntual_periodica_value", limit: 255
    t.index ["bundle"], name: "field_revision_field_puntual_periodica_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_puntual_periodica_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_puntual_periodica_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_puntual_periodica_entity_type_idx", using: :btree
    t.index ["field_puntual_periodica_value"], name: "field_revision_field_puntual_periodica_field_puntual_periodica_", using: :btree
    t.index ["language"], name: "field_revision_field_puntual_periodica_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_puntual_periodica_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_segon_cognom", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",               limit: 128, default: "", null: false
    t.string  "bundle",                    limit: 128, default: "", null: false
    t.integer "deleted",                   limit: 2,   default: 0,  null: false
    t.integer "entity_id",                 limit: 8,                null: false
    t.integer "revision_id",               limit: 8,                null: false
    t.string  "language",                  limit: 32,  default: "", null: false
    t.integer "delta",                     limit: 8,                null: false
    t.string  "field_segon_cognom_value",  limit: 255
    t.string  "field_segon_cognom_format", limit: 255
    t.index ["bundle"], name: "field_revision_field_segon_cognom_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_segon_cognom_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_segon_cognom_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_segon_cognom_entity_type_idx", using: :btree
    t.index ["field_segon_cognom_format"], name: "field_revision_field_segon_cognom_field_segon_cognom_format_idx", using: :btree
    t.index ["language"], name: "field_revision_field_segon_cognom_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_segon_cognom_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_segons", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",         limit: 128, default: "", null: false
    t.string  "bundle",              limit: 128, default: "", null: false
    t.integer "deleted",             limit: 2,   default: 0,  null: false
    t.integer "entity_id",           limit: 8,                null: false
    t.integer "revision_id",         limit: 8,                null: false
    t.string  "language",            limit: 32,  default: "", null: false
    t.integer "delta",               limit: 8,                null: false
    t.string  "field_segons_value",  limit: 255
    t.string  "field_segons_format", limit: 255
    t.index ["bundle"], name: "field_revision_field_segons_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_segons_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_segons_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_segons_entity_type_idx", using: :btree
    t.index ["field_segons_format"], name: "field_revision_field_segons_field_segons_format_idx", using: :btree
    t.index ["language"], name: "field_revision_field_segons_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_segons_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_simplenews_term", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",               limit: 128, default: "", null: false
    t.string  "bundle",                    limit: 128, default: "", null: false
    t.integer "deleted",                   limit: 2,   default: 0,  null: false
    t.integer "entity_id",                 limit: 8,                null: false
    t.integer "revision_id",               limit: 8,                null: false
    t.string  "language",                  limit: 32,  default: "", null: false
    t.integer "delta",                     limit: 8,                null: false
    t.integer "field_simplenews_term_tid", limit: 8
    t.index ["bundle"], name: "field_revision_field_simplenews_term_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_simplenews_term_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_simplenews_term_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_simplenews_term_entity_type_idx", using: :btree
    t.index ["field_simplenews_term_tid"], name: "field_revision_field_simplenews_term_field_simplenews_term_tid_", using: :btree
    t.index ["language"], name: "field_revision_field_simplenews_term_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_simplenews_term_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_tags", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",    limit: 128, default: "", null: false
    t.string  "bundle",         limit: 128, default: "", null: false
    t.integer "deleted",        limit: 2,   default: 0,  null: false
    t.integer "entity_id",      limit: 8,                null: false
    t.integer "revision_id",    limit: 8,                null: false
    t.string  "language",       limit: 32,  default: "", null: false
    t.integer "delta",          limit: 8,                null: false
    t.integer "field_tags_tid", limit: 8
    t.index ["bundle"], name: "field_revision_field_tags_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_tags_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_tags_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_tags_entity_type_idx", using: :btree
    t.index ["field_tags_tid"], name: "field_revision_field_tags_field_tags_tid_idx", using: :btree
    t.index ["language"], name: "field_revision_field_tags_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_tags_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_taller_cicle", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                  limit: 128, default: "", null: false
    t.string  "bundle",                       limit: 128, default: "", null: false
    t.integer "deleted",                      limit: 2,   default: 0,  null: false
    t.integer "entity_id",                    limit: 8,                null: false
    t.integer "revision_id",                  limit: 8,                null: false
    t.string  "language",                     limit: 32,  default: "", null: false
    t.integer "delta",                        limit: 8,                null: false
    t.integer "field_taller_cicle_target_id", limit: 8,                null: false
    t.index ["bundle"], name: "field_revision_field_taller_cicle_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_taller_cicle_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_taller_cicle_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_taller_cicle_entity_type_idx", using: :btree
    t.index ["field_taller_cicle_target_id"], name: "field_revision_field_taller_cicle_field_taller_cicle_target_id_", using: :btree
    t.index ["language"], name: "field_revision_field_taller_cicle_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_taller_cicle_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_telefon", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",          limit: 128, default: "", null: false
    t.string  "bundle",               limit: 128, default: "", null: false
    t.integer "deleted",              limit: 2,   default: 0,  null: false
    t.integer "entity_id",            limit: 8,                null: false
    t.integer "revision_id",          limit: 8,                null: false
    t.string  "language",             limit: 32,  default: "", null: false
    t.integer "delta",                limit: 8,                null: false
    t.string  "field_telefon_value",  limit: 255
    t.string  "field_telefon_format", limit: 255
    t.index ["bundle"], name: "field_revision_field_telefon_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_telefon_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_telefon_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_telefon_entity_type_idx", using: :btree
    t.index ["field_telefon_format"], name: "field_revision_field_telefon_field_telefon_format_idx", using: :btree
    t.index ["language"], name: "field_revision_field_telefon_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_telefon_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_tipus_seccio_entitat", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                      limit: 128, default: "", null: false
    t.string  "bundle",                           limit: 128, default: "", null: false
    t.integer "deleted",                          limit: 2,   default: 0,  null: false
    t.integer "entity_id",                        limit: 8,                null: false
    t.integer "revision_id",                      limit: 8,                null: false
    t.string  "language",                         limit: 32,  default: "", null: false
    t.integer "delta",                            limit: 8,                null: false
    t.string  "field_tipus_seccio_entitat_value", limit: 255
    t.index ["bundle"], name: "field_revision_field_tipus_seccio_entitat_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_tipus_seccio_entitat_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_tipus_seccio_entitat_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_tipus_seccio_entitat_entity_type_idx", using: :btree
    t.index ["field_tipus_seccio_entitat_value"], name: "field_revision_field_tipus_seccio_entitat_field_tipus_seccio_en", using: :btree
    t.index ["language"], name: "field_revision_field_tipus_seccio_entitat_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_tipus_seccio_entitat_revision_id_idx", using: :btree
  end

  create_table "field_revision_field_tipus_taller_cicle", primary_key: ["entity_type", "entity_id", "revision_id", "deleted", "delta", "language"], force: :cascade do |t|
    t.string  "entity_type",                    limit: 128, default: "", null: false
    t.string  "bundle",                         limit: 128, default: "", null: false
    t.integer "deleted",                        limit: 2,   default: 0,  null: false
    t.integer "entity_id",                      limit: 8,                null: false
    t.integer "revision_id",                    limit: 8,                null: false
    t.string  "language",                       limit: 32,  default: "", null: false
    t.integer "delta",                          limit: 8,                null: false
    t.string  "field_tipus_taller_cicle_value", limit: 255
    t.index ["bundle"], name: "field_revision_field_tipus_taller_cicle_bundle_idx", using: :btree
    t.index ["deleted"], name: "field_revision_field_tipus_taller_cicle_deleted_idx", using: :btree
    t.index ["entity_id"], name: "field_revision_field_tipus_taller_cicle_entity_id_idx", using: :btree
    t.index ["entity_type"], name: "field_revision_field_tipus_taller_cicle_entity_type_idx", using: :btree
    t.index ["field_tipus_taller_cicle_value"], name: "field_revision_field_tipus_taller_cicle_field_tipus_taller_cicl", using: :btree
    t.index ["language"], name: "field_revision_field_tipus_taller_cicle_language_idx", using: :btree
    t.index ["revision_id"], name: "field_revision_field_tipus_taller_cicle_revision_id_idx", using: :btree
  end

  create_table "file_display", primary_key: "name", id: :string, limit: 255, force: :cascade do |t|
    t.integer "weight",   default: 0, null: false
    t.integer "status",   default: 0, null: false
    t.binary  "settings"
  end

  create_table "file_managed", primary_key: "fid", force: :cascade do |t|
    t.integer "uid",       limit: 8,   default: 0,           null: false
    t.string  "filename",  limit: 255, default: "",          null: false
    t.string  "uri",       limit: 255, default: "",          null: false
    t.string  "filemime",  limit: 255, default: "",          null: false
    t.integer "filesize",  limit: 8,   default: 0,           null: false
    t.integer "status",    limit: 2,   default: 0,           null: false
    t.integer "timestamp", limit: 8,   default: 0,           null: false
    t.string  "type",      limit: 50,  default: "undefined", null: false
    t.index ["status"], name: "file_managed_status_idx", using: :btree
    t.index ["timestamp"], name: "file_managed_timestamp_idx", using: :btree
    t.index ["type"], name: "file_managed_file_type_idx", using: :btree
    t.index ["uid"], name: "file_managed_uid_idx", using: :btree
    t.index ["uri"], name: "file_managed_uri_key", unique: true, using: :btree
  end

  create_table "file_metadata", primary_key: ["fid", "name"], force: :cascade do |t|
    t.integer "fid",   limit: 8,   default: 0, null: false
    t.string  "name",  limit: 255,             null: false
    t.binary  "value"
  end

  create_table "file_type", primary_key: "type", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.string "label",       limit: 255, default: "", null: false
    t.text   "description",                          null: false
    t.binary "mimetypes"
  end

  create_table "file_usage", primary_key: ["fid", "type", "id", "module"], force: :cascade do |t|
    t.integer "fid",    limit: 8,                null: false
    t.string  "module", limit: 255, default: "", null: false
    t.string  "type",   limit: 64,  default: "", null: false
    t.integer "id",     limit: 8,   default: 0,  null: false
    t.integer "count",  limit: 8,   default: 0,  null: false
    t.index ["fid", "count"], name: "file_usage_fid_count_idx", using: :btree
    t.index ["fid", "module"], name: "file_usage_fid_module_idx", using: :btree
    t.index ["type", "id"], name: "file_usage_type_id_idx", using: :btree
  end

  create_table "filter", primary_key: ["format", "name"], force: :cascade do |t|
    t.string  "format",   limit: 255,              null: false
    t.string  "module",   limit: 64,  default: "", null: false
    t.string  "name",     limit: 32,  default: "", null: false
    t.integer "weight",               default: 0,  null: false
    t.integer "status",               default: 0,  null: false
    t.binary  "settings"
    t.index ["weight", "module", "name"], name: "filter_list_idx", using: :btree
  end

  create_table "filter_format", primary_key: "format", id: :string, limit: 255, force: :cascade do |t|
    t.string  "name",   limit: 255, default: "", null: false
    t.integer "cache",  limit: 2,   default: 0,  null: false
    t.integer "status",             default: 1,  null: false
    t.integer "weight",             default: 0,  null: false
    t.index ["name"], name: "filter_format_name_key", unique: true, using: :btree
    t.index ["status", "weight"], name: "filter_format_status_weight_idx", using: :btree
  end

  create_table "flood", primary_key: "fid", force: :cascade do |t|
    t.string  "event",      limit: 64,  default: "", null: false
    t.string  "identifier", limit: 128, default: "", null: false
    t.integer "timestamp",              default: 0,  null: false
    t.integer "expiration",             default: 0,  null: false
    t.index ["event", "identifier", "timestamp"], name: "flood_allow_idx", using: :btree
    t.index ["expiration"], name: "flood_purge_idx", using: :btree
  end

  create_table "history", primary_key: ["uid", "nid"], force: :cascade do |t|
    t.integer "uid",       default: 0, null: false
    t.integer "nid",       default: 0, null: false
    t.integer "timestamp", default: 0, null: false
    t.index ["nid"], name: "history_nid_idx", using: :btree
  end

  create_table "i18n_string", primary_key: "lid", id: :integer, default: 0, force: :cascade do |t|
    t.string  "textgroup",   limit: 50,  default: "default", null: false
    t.string  "context",     limit: 255, default: "",        null: false
    t.string  "objectid",    limit: 255, default: "",        null: false
    t.string  "type",        limit: 255, default: "",        null: false
    t.string  "property",    limit: 255, default: "",        null: false
    t.integer "objectindex",             default: 0,         null: false
    t.string  "format",      limit: 255
    t.index ["textgroup"], name: "i18n_string_group_context_idx", using: :btree
  end

  create_table "i18n_translation_set", primary_key: "tsid", force: :cascade do |t|
    t.string  "title",     limit: 255, default: "", null: false
    t.string  "type",      limit: 32,  default: "", null: false
    t.string  "bundle",    limit: 128, default: "", null: false
    t.integer "master_id", limit: 8,   default: 0,  null: false
    t.integer "status",                default: 1,  null: false
    t.integer "created",               default: 0,  null: false
    t.integer "changed",               default: 0,  null: false
    t.index ["type", "bundle"], name: "i18n_translation_set_entity_bundle_idx", using: :btree
  end

  create_table "image_effects", primary_key: "ieid", force: :cascade do |t|
    t.integer "isid",   limit: 8,   default: 0, null: false
    t.integer "weight",             default: 0, null: false
    t.string  "name",   limit: 255,             null: false
    t.binary  "data",                           null: false
    t.index ["isid"], name: "image_effects_isid_idx", using: :btree
    t.index ["weight"], name: "image_effects_weight_idx", using: :btree
  end

  create_table "image_styles", primary_key: "isid", force: :cascade do |t|
    t.string "name",  limit: 255,              null: false
    t.string "label", limit: 255, default: "", null: false
    t.index ["name"], name: "image_styles_name_key", unique: true, using: :btree
  end

  create_table "languages", primary_key: "language", id: :string, limit: 12, default: "", force: :cascade do |t|
    t.string  "name",       limit: 64,  default: "", null: false
    t.string  "native",     limit: 64,  default: "", null: false
    t.integer "direction",              default: 0,  null: false
    t.integer "enabled",                default: 0,  null: false
    t.integer "plurals",                default: 0,  null: false
    t.string  "formula",    limit: 255, default: "", null: false
    t.string  "domain",     limit: 128, default: "", null: false
    t.string  "prefix",     limit: 128, default: "", null: false
    t.integer "weight",                 default: 0,  null: false
    t.string  "javascript", limit: 64,  default: "", null: false
    t.index ["weight", "name"], name: "languages_list_idx", using: :btree
  end

  create_table "locales_source", primary_key: "lid", force: :cascade do |t|
    t.text   "location"
    t.string "textgroup", limit: 255, default: "default", null: false
    t.text   "source",                                    null: false
    t.string "context",   limit: 255, default: "",        null: false
    t.string "version",   limit: 20,  default: "none",    null: false
    t.index ["context"], name: "locales_source_source_context_idx", using: :btree
    t.index ["textgroup"], name: "locales_source_textgroup_context_idx", using: :btree
  end

  create_table "locales_target", primary_key: ["language", "lid", "plural"], force: :cascade do |t|
    t.integer "lid",                    default: 0,  null: false
    t.text    "translation",                         null: false
    t.string  "language",    limit: 12, default: "", null: false
    t.integer "plid",                   default: 0,  null: false
    t.integer "plural",                 default: 0,  null: false
    t.integer "i18n_status",            default: 0,  null: false
    t.index ["lid"], name: "locales_target_lid_idx", using: :btree
    t.index ["plid"], name: "locales_target_plid_idx", using: :btree
    t.index ["plural"], name: "locales_target_plural_idx", using: :btree
  end

  create_table "menu_custom", primary_key: "menu_name", id: :string, limit: 32, default: "", force: :cascade do |t|
    t.string "title",       limit: 255, default: "", null: false
    t.text   "description"
  end

  create_table "menu_links", primary_key: "mlid", force: :cascade do |t|
    t.string  "menu_name",    limit: 32,  default: "",       null: false
    t.integer "plid",         limit: 8,   default: 0,        null: false
    t.string  "link_path",    limit: 255, default: "",       null: false
    t.string  "router_path",  limit: 255, default: "",       null: false
    t.string  "link_title",   limit: 255, default: "",       null: false
    t.binary  "options"
    t.string  "module",       limit: 255, default: "system", null: false
    t.integer "hidden",       limit: 2,   default: 0,        null: false
    t.integer "external",     limit: 2,   default: 0,        null: false
    t.integer "has_children", limit: 2,   default: 0,        null: false
    t.integer "expanded",     limit: 2,   default: 0,        null: false
    t.integer "weight",                   default: 0,        null: false
    t.integer "depth",        limit: 2,   default: 0,        null: false
    t.integer "customized",   limit: 2,   default: 0,        null: false
    t.integer "p1",           limit: 8,   default: 0,        null: false
    t.integer "p2",           limit: 8,   default: 0,        null: false
    t.integer "p3",           limit: 8,   default: 0,        null: false
    t.integer "p4",           limit: 8,   default: 0,        null: false
    t.integer "p5",           limit: 8,   default: 0,        null: false
    t.integer "p6",           limit: 8,   default: 0,        null: false
    t.integer "p7",           limit: 8,   default: 0,        null: false
    t.integer "p8",           limit: 8,   default: 0,        null: false
    t.integer "p9",           limit: 8,   default: 0,        null: false
    t.integer "updated",      limit: 2,   default: 0,        null: false
    t.index ["menu_name", "p1", "p2", "p3", "p4", "p5", "p6", "p7", "p8", "p9"], name: "menu_links_menu_parents_idx", using: :btree
    t.index ["menu_name", "plid", "expanded", "has_children"], name: "menu_links_menu_plid_expand_child_idx", using: :btree
    t.index ["menu_name"], name: "menu_links_path_menu_idx", using: :btree
  end

  create_table "menu_router", primary_key: "path", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.binary  "load_functions",                             null: false
    t.binary  "to_arg_functions",                           null: false
    t.string  "access_callback",   limit: 255, default: "", null: false
    t.binary  "access_arguments"
    t.string  "page_callback",     limit: 255, default: "", null: false
    t.binary  "page_arguments"
    t.string  "delivery_callback", limit: 255, default: "", null: false
    t.integer "fit",                           default: 0,  null: false
    t.integer "number_parts",      limit: 2,   default: 0,  null: false
    t.integer "context",                       default: 0,  null: false
    t.string  "tab_parent",        limit: 255, default: "", null: false
    t.string  "tab_root",          limit: 255, default: "", null: false
    t.string  "title",             limit: 255, default: "", null: false
    t.string  "title_callback",    limit: 255, default: "", null: false
    t.string  "title_arguments",   limit: 255, default: "", null: false
    t.string  "theme_callback",    limit: 255, default: "", null: false
    t.string  "theme_arguments",   limit: 255, default: "", null: false
    t.integer "type",                          default: 0,  null: false
    t.text    "description",                                null: false
    t.string  "position",          limit: 255, default: "", null: false
    t.integer "weight",                        default: 0,  null: false
    t.text    "include_file"
    t.index ["fit"], name: "menu_router_fit_idx", using: :btree
    t.index ["weight", "title"], name: "menu_router_tab_parent_idx", using: :btree
    t.index ["weight", "title"], name: "menu_router_tab_root_weight_title_idx", using: :btree
  end

  create_table "metatag", primary_key: ["entity_type", "entity_id", "revision_id", "language"], force: :cascade do |t|
    t.string  "entity_type", limit: 32, default: "", null: false
    t.integer "entity_id",   limit: 8,  default: 0,  null: false
    t.integer "revision_id", limit: 8,  default: 0,  null: false
    t.string  "language",    limit: 32, default: "", null: false
    t.binary  "data",                                null: false
    t.index ["entity_type", "revision_id"], name: "metatag_type_revision_idx", using: :btree
  end

  create_table "metatag_config", primary_key: "cid", force: :cascade do |t|
    t.string "instance", limit: 255, default: "", null: false
    t.binary "config",                            null: false
    t.index ["instance"], name: "metatag_config_instance_key", unique: true, using: :btree
  end

  create_table "node", primary_key: "nid", force: :cascade do |t|
    t.integer "vid",       limit: 8
    t.string  "type",      limit: 32,  default: "", null: false
    t.string  "language",  limit: 12,  default: "", null: false
    t.string  "title",     limit: 255, default: "", null: false
    t.integer "uid",                   default: 0,  null: false
    t.integer "status",                default: 1,  null: false
    t.integer "created",               default: 0,  null: false
    t.integer "changed",               default: 0,  null: false
    t.integer "comment",               default: 0,  null: false
    t.integer "promote",               default: 0,  null: false
    t.integer "sticky",                default: 0,  null: false
    t.integer "tnid",      limit: 8,   default: 0,  null: false
    t.integer "translate",             default: 0,  null: false
    t.index ["changed"], name: "node_node_changed_idx", using: :btree
    t.index ["created"], name: "node_node_created_idx", using: :btree
    t.index ["language"], name: "node_language_idx", using: :btree
    t.index ["promote", "status", "sticky", "created"], name: "node_node_frontpage_idx", using: :btree
    t.index ["status", "type", "nid"], name: "node_node_status_type_idx", using: :btree
    t.index ["title"], name: "node_node_title_type_idx", using: :btree
    t.index ["tnid"], name: "node_tnid_idx", using: :btree
    t.index ["translate"], name: "node_translate_idx", using: :btree
    t.index ["uid"], name: "node_uid_idx", using: :btree
    t.index ["vid"], name: "node_vid_key", unique: true, using: :btree
  end

  create_table "node_access", primary_key: ["nid", "gid", "realm"], force: :cascade do |t|
    t.integer "nid",          limit: 8,   default: 0,  null: false
    t.integer "gid",          limit: 8,   default: 0,  null: false
    t.string  "realm",        limit: 255, default: "", null: false
    t.integer "grant_view",               default: 0,  null: false
    t.integer "grant_update",             default: 0,  null: false
    t.integer "grant_delete",             default: 0,  null: false
  end

  create_table "node_comment_statistics", primary_key: "nid", id: :integer, limit: 8, default: 0, force: :cascade do |t|
    t.integer "cid",                               default: 0, null: false
    t.integer "last_comment_timestamp",            default: 0, null: false
    t.string  "last_comment_name",      limit: 60
    t.integer "last_comment_uid",                  default: 0, null: false
    t.integer "comment_count",          limit: 8,  default: 0, null: false
    t.index ["comment_count"], name: "node_comment_statistics_comment_count_idx", using: :btree
    t.index ["last_comment_timestamp"], name: "node_comment_statistics_node_comment_timestamp_idx", using: :btree
    t.index ["last_comment_uid"], name: "node_comment_statistics_last_comment_uid_idx", using: :btree
  end

  create_table "node_convert_templates", primary_key: "nctid", force: :cascade do |t|
    t.string "machine_name",     limit: 255, default: "", null: false
    t.text   "name"
    t.text   "source_type"
    t.text   "destination_type",                          null: false
    t.text   "data"
  end

  create_table "node_revision", primary_key: "vid", force: :cascade do |t|
    t.integer "nid",       limit: 8,   default: 0,  null: false
    t.integer "uid",                   default: 0,  null: false
    t.string  "title",     limit: 255, default: "", null: false
    t.text    "log",                                null: false
    t.integer "timestamp",             default: 0,  null: false
    t.integer "status",                default: 1,  null: false
    t.integer "comment",               default: 0,  null: false
    t.integer "promote",               default: 0,  null: false
    t.integer "sticky",                default: 0,  null: false
    t.index ["nid"], name: "node_revision_nid_idx", using: :btree
    t.index ["uid"], name: "node_revision_uid_idx", using: :btree
  end

  create_table "node_type", primary_key: "type", id: :string, limit: 32, force: :cascade do |t|
    t.string  "name",        limit: 255, default: "", null: false
    t.string  "base",        limit: 255,              null: false
    t.string  "module",      limit: 255,              null: false
    t.text    "description",                          null: false
    t.text    "help",                                 null: false
    t.integer "has_title",                            null: false
    t.string  "title_label", limit: 255, default: "", null: false
    t.integer "custom",      limit: 2,   default: 0,  null: false
    t.integer "modified",    limit: 2,   default: 0,  null: false
    t.integer "locked",      limit: 2,   default: 0,  null: false
    t.integer "disabled",    limit: 2,   default: 0,  null: false
    t.string  "orig_type",   limit: 255, default: "", null: false
  end

  create_table "page_manager_handlers", primary_key: "did", force: :cascade do |t|
    t.string  "name",    limit: 255
    t.string  "task",    limit: 64
    t.string  "subtask", limit: 64,  default: "", null: false
    t.string  "handler", limit: 64
    t.integer "weight"
    t.text    "conf",                             null: false
    t.index ["name"], name: "page_manager_handlers_name_key", unique: true, using: :btree
    t.index ["task", "subtask", "weight"], name: "page_manager_handlers_fulltask_idx", using: :btree
  end

  create_table "page_manager_pages", primary_key: "pid", force: :cascade do |t|
    t.string "name",              limit: 255
    t.string "task",              limit: 64,  default: "page"
    t.string "admin_title",       limit: 255
    t.text   "admin_description"
    t.string "path",              limit: 255
    t.text   "access",                                         null: false
    t.text   "menu",                                           null: false
    t.text   "arguments",                                      null: false
    t.text   "conf",                                           null: false
    t.index ["name"], name: "page_manager_pages_name_key", unique: true, using: :btree
    t.index ["task"], name: "page_manager_pages_task_idx", using: :btree
  end

  create_table "page_manager_weights", primary_key: "name", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.integer "weight"
    t.index ["name", "weight"], name: "page_manager_weights_weights_idx", using: :btree
  end

  create_table "panelizer_defaults", primary_key: "pnid", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.string  "title",          limit: 255
    t.string  "panelizer_type", limit: 32
    t.string  "panelizer_key",  limit: 128
    t.integer "no_blocks",      limit: 2,   default: 0
    t.string  "css_id",         limit: 255, default: ""
    t.text    "css"
    t.string  "pipeline",       limit: 255, default: "standard"
    t.text    "contexts"
    t.text    "relationships"
    t.integer "did",                                             null: false
    t.text    "access"
    t.string  "view_mode",      limit: 128
    t.string  "css_class",      limit: 255, default: ""
    t.string  "title_element",  limit: 255, default: "H2"
    t.integer "link_to_entity", limit: 2,   default: 1
    t.text    "extra"
    t.index ["name"], name: "panelizer_defaults_name_idx", using: :btree
    t.index ["panelizer_type", "panelizer_key"], name: "panelizer_defaults_type_key_idx", using: :btree
  end

  create_table "panelizer_entity", primary_key: ["entity_type", "entity_id", "revision_id", "view_mode"], force: :cascade do |t|
    t.string  "entity_type",    limit: 128,                      null: false
    t.integer "entity_id",                  default: 0,          null: false
    t.integer "revision_id",    limit: 8,                        null: false
    t.string  "name",           limit: 255
    t.integer "no_blocks",      limit: 2,   default: 0
    t.string  "css_id",         limit: 255, default: ""
    t.text    "css"
    t.string  "pipeline",       limit: 255, default: "standard"
    t.text    "contexts"
    t.text    "relationships"
    t.integer "did",                                             null: false
    t.string  "view_mode",      limit: 128,                      null: false
    t.string  "css_class",      limit: 255, default: ""
    t.string  "title_element",  limit: 255, default: "H2"
    t.integer "link_to_entity", limit: 2,   default: 1
    t.text    "extra"
  end

  create_table "panels_display", primary_key: "did", force: :cascade do |t|
    t.string  "layout",          limit: 255, default: ""
    t.text    "layout_settings"
    t.text    "panel_settings"
    t.text    "cache"
    t.string  "title",           limit: 255, default: ""
    t.integer "hide_title",      limit: 2,   default: 0
    t.integer "title_pane",                  default: 0
    t.string  "uuid",            limit: 36
  end

  create_table "panels_layout", primary_key: "lid", force: :cascade do |t|
    t.string "name",              limit: 255
    t.string "admin_title",       limit: 255
    t.text   "admin_description"
    t.string "category",          limit: 255
    t.string "plugin",            limit: 255
    t.text   "settings"
  end

  create_table "panels_pane", primary_key: "pid", force: :cascade do |t|
    t.integer "did",                      default: 0,  null: false
    t.string  "panel",         limit: 32, default: ""
    t.string  "type",          limit: 32, default: ""
    t.string  "subtype",       limit: 64, default: ""
    t.integer "shown",         limit: 2,  default: 1
    t.text    "access"
    t.text    "configuration"
    t.text    "cache"
    t.text    "style"
    t.text    "css"
    t.text    "extras"
    t.integer "position",      limit: 2,  default: 0
    t.text    "locks"
    t.string  "uuid",          limit: 36
    t.index ["did"], name: "panels_pane_did_idx_idx", using: :btree
  end

  create_table "panels_renderer_pipeline", primary_key: "rpid", force: :cascade do |t|
    t.string  "name",              limit: 255
    t.string  "admin_title",       limit: 255
    t.text    "admin_description"
    t.integer "weight",            limit: 2,   default: 0
    t.text    "settings"
  end

  create_table "queue", primary_key: "item_id", force: :cascade do |t|
    t.string  "name",    limit: 255, default: "", null: false
    t.binary  "data"
    t.integer "expire",              default: 0,  null: false
    t.integer "created",             default: 0,  null: false
    t.index ["expire"], name: "queue_expire_idx", using: :btree
    t.index ["name", "created"], name: "queue_name_created_idx", using: :btree
  end

  create_table "rdf_mapping", primary_key: ["type", "bundle"], force: :cascade do |t|
    t.string "type",    limit: 128, null: false
    t.string "bundle",  limit: 128, null: false
    t.binary "mapping"
  end

  create_table "registry", primary_key: ["name", "type"], force: :cascade do |t|
    t.string  "name",     limit: 255, default: "", null: false
    t.string  "type",     limit: 9,   default: "", null: false
    t.string  "filename", limit: 255,              null: false
    t.string  "module",   limit: 255, default: "", null: false
    t.integer "weight",               default: 0,  null: false
    t.index ["type", "weight", "module"], name: "registry_hook_idx", using: :btree
  end

  create_table "registry_file", primary_key: "filename", id: :string, limit: 255, force: :cascade do |t|
    t.string "hash", limit: 64, null: false
  end

  create_table "role", primary_key: "rid", force: :cascade do |t|
    t.string  "name",   limit: 64, default: "", null: false
    t.integer "weight",            default: 0,  null: false
    t.index ["name", "weight"], name: "role_name_weight_idx", using: :btree
    t.index ["name"], name: "role_name_key", unique: true, using: :btree
  end

  create_table "role_permission", primary_key: ["rid", "permission"], force: :cascade do |t|
    t.integer "rid",        limit: 8,                null: false
    t.string  "permission", limit: 128, default: "", null: false
    t.string  "module",     limit: 255, default: "", null: false
    t.index ["permission"], name: "role_permission_permission_idx", using: :btree
  end

  create_table "rules_config", force: :cascade do |t|
    t.string  "name",           limit: 64,                        null: false
    t.string  "label",          limit: 255, default: "unlabeled", null: false
    t.string  "plugin",         limit: 127,                       null: false
    t.integer "active",                     default: 1,           null: false
    t.integer "weight",         limit: 2,   default: 0,           null: false
    t.integer "status",         limit: 2,   default: 1,           null: false
    t.integer "dirty",          limit: 2,   default: 0,           null: false
    t.string  "module",         limit: 255
    t.string  "owner",          limit: 255, default: "rules",     null: false
    t.integer "access_exposed", limit: 2,   default: 0,           null: false
    t.binary  "data"
    t.index ["name"], name: "rules_config_name_key", unique: true, using: :btree
    t.index ["plugin"], name: "rules_config_plugin_idx", using: :btree
  end

  create_table "rules_dependencies", primary_key: ["id", "module"], force: :cascade do |t|
    t.integer "id",     limit: 8,   null: false
    t.string  "module", limit: 255, null: false
    t.index ["module"], name: "rules_dependencies_module_idx", using: :btree
  end

  create_table "rules_tags", primary_key: ["id", "tag"], force: :cascade do |t|
    t.integer "id",  limit: 8,   null: false
    t.string  "tag", limit: 255, null: false
  end

  create_table "rules_trigger", primary_key: ["id", "event"], force: :cascade do |t|
    t.integer "id",    limit: 8,                null: false
    t.string  "event", limit: 127, default: "", null: false
  end

  create_table "search_dataset", primary_key: ["sid", "type"], force: :cascade do |t|
    t.integer "sid",     limit: 8,  default: 0, null: false
    t.string  "type",    limit: 16,             null: false
    t.text    "data",                           null: false
    t.integer "reindex", limit: 8,  default: 0, null: false
  end

  create_table "search_index", primary_key: ["word", "sid", "type"], force: :cascade do |t|
    t.string  "word",  limit: 50, default: "", null: false
    t.integer "sid",   limit: 8,  default: 0,  null: false
    t.string  "type",  limit: 16,              null: false
    t.float   "score"
    t.index ["sid", "type"], name: "search_index_sid_type_idx", using: :btree
  end

  create_table "search_node_links", primary_key: ["sid", "type", "nid"], force: :cascade do |t|
    t.integer "sid",     limit: 8,  default: 0,  null: false
    t.string  "type",    limit: 16, default: "", null: false
    t.integer "nid",     limit: 8,  default: 0,  null: false
    t.text    "caption"
    t.index ["nid"], name: "search_node_links_nid_idx", using: :btree
  end

  create_table "search_total", primary_key: "word", id: :string, limit: 50, default: "", force: :cascade do |t|
    t.float "count"
  end

  create_table "semaphore", primary_key: "name", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.string "value",  limit: 255, default: "", null: false
    t.float  "expire",                          null: false
    t.index ["expire"], name: "semaphore_expire_idx", using: :btree
    t.index ["value"], name: "semaphore_value_idx", using: :btree
  end

  create_table "sequences", primary_key: "value", force: :cascade do |t|
  end

  create_table "sessions", primary_key: ["sid", "ssid"], force: :cascade do |t|
    t.integer "uid",       limit: 8,                null: false
    t.string  "sid",       limit: 128,              null: false
    t.string  "ssid",      limit: 128, default: "", null: false
    t.string  "hostname",  limit: 128, default: "", null: false
    t.integer "timestamp",             default: 0,  null: false
    t.integer "cache",                 default: 0,  null: false
    t.binary  "session"
    t.index ["ssid"], name: "sessions_ssid_idx", using: :btree
    t.index ["timestamp"], name: "sessions_timestamp_idx", using: :btree
    t.index ["uid"], name: "sessions_uid_idx", using: :btree
  end

  create_table "shortcut_set", primary_key: "set_name", id: :string, limit: 32, default: "", force: :cascade do |t|
    t.string "title", limit: 255, default: "", null: false
  end

  create_table "shortcut_set_users", primary_key: "uid", id: :integer, limit: 8, default: 0, force: :cascade do |t|
    t.string "set_name", limit: 32, default: "", null: false
    t.index ["set_name"], name: "shortcut_set_users_set_name_idx", using: :btree
  end

  create_table "simplenews_category", primary_key: "tid", id: :integer, default: 0, force: :cascade do |t|
    t.string  "format",        limit: 8,   default: "", null: false
    t.integer "priority",                  default: 0,  null: false
    t.integer "receipt",                   default: 0,  null: false
    t.string  "from_name",     limit: 128, default: "", null: false
    t.string  "email_subject", limit: 255, default: "", null: false
    t.string  "from_address",  limit: 64,  default: "", null: false
    t.integer "hyperlinks",    limit: 2,   default: 0,  null: false
    t.string  "new_account",   limit: 12,  default: "", null: false
    t.string  "opt_inout",     limit: 12,  default: "", null: false
    t.integer "block",         limit: 2,   default: 0,  null: false
  end

  create_table "simplenews_mail_spool", primary_key: "msid", force: :cascade do |t|
    t.string  "mail",      limit: 255, default: "", null: false
    t.integer "nid",                   default: 0,  null: false
    t.integer "tid",                   default: 0,  null: false
    t.integer "status",                default: 0,  null: false
    t.integer "error",     limit: 2,   default: 0,  null: false
    t.integer "timestamp", limit: 8,   default: 0,  null: false
    t.text    "data"
    t.integer "snid",                  default: 0,  null: false
    t.index ["snid", "tid"], name: "simplenews_mail_spool_snid_tid_idx", using: :btree
    t.index ["status"], name: "simplenews_mail_spool_status_idx", using: :btree
    t.index ["tid"], name: "simplenews_mail_spool_tid_idx", using: :btree
  end

  create_table "simplenews_newsletter", primary_key: "nid", id: :integer, default: 0, force: :cascade do |t|
    t.integer "tid",                             default: 0, null: false
    t.integer "status",                limit: 2, default: 0, null: false
    t.integer "sent_subscriber_count",           default: 0, null: false
  end

  create_table "simplenews_sending_time", primary_key: "nid", id: :integer, default: 0, force: :cascade do |t|
    t.integer "time",           default: 0, null: false
    t.integer "sent", limit: 2, default: 0, null: false
  end

  create_table "simplenews_statistics", primary_key: "nid", id: :integer, default: 0, force: :cascade do |t|
    t.integer "subscriber_count",               default: 0,  null: false
    t.integer "send_start_timestamp", limit: 8, default: 0,  null: false
    t.integer "send_end_timestamp",   limit: 8, default: 0,  null: false
    t.integer "archived",                       default: 0,  null: false
    t.integer "unique_opens",                   default: -1, null: false
    t.integer "total_opens",                    default: -1, null: false
    t.integer "unique_clicks",                  default: -1, null: false
  end

  create_table "simplenews_statistics_click", primary_key: "clid", force: :cascade do |t|
    t.integer "urlid",               default: 0, null: false
    t.integer "snid",                default: 0, null: false
    t.integer "timestamp", limit: 8, default: 0, null: false
    t.index ["urlid"], name: "simplenews_statistics_click_urlid_idx", using: :btree
  end

  create_table "simplenews_statistics_open", primary_key: "opid", force: :cascade do |t|
    t.integer "snid",                default: 0, null: false
    t.integer "nid",                 default: 0, null: false
    t.integer "timestamp", limit: 8, default: 0, null: false
    t.index ["nid"], name: "simplenews_statistics_open_nid_idx", using: :btree
  end

  create_table "simplenews_statistics_url", primary_key: "urlid", force: :cascade do |t|
    t.integer "nid",         default: 0,  null: false
    t.text    "url",                      null: false
    t.integer "click_count", default: -1, null: false
    t.index ["nid"], name: "simplenews_statistics_url_nid_idx", using: :btree
  end

  create_table "simplenews_subscriber", primary_key: "snid", force: :cascade do |t|
    t.integer "activated", limit: 2,  default: 0,  null: false
    t.string  "mail",      limit: 64, default: "", null: false
    t.integer "uid",                  default: 0,  null: false
    t.string  "language",  limit: 12, default: "", null: false
    t.integer "timestamp", limit: 8,  default: 0,  null: false
    t.text    "changes"
    t.integer "created",   limit: 8,  default: 0,  null: false
    t.index ["mail"], name: "simplenews_subscriber_mail_idx", using: :btree
    t.index ["uid"], name: "simplenews_subscriber_uid_idx", using: :btree
  end

  create_table "simplenews_subscription", primary_key: ["snid", "tid"], force: :cascade do |t|
    t.integer "snid",                 default: 0,  null: false
    t.integer "tid",                  default: 0,  null: false
    t.integer "status",    limit: 2,  default: 1,  null: false
    t.integer "timestamp", limit: 8,  default: 0,  null: false
    t.string  "source",    limit: 24, default: "", null: false
  end

  create_table "stylizer", primary_key: "sid", force: :cascade do |t|
    t.string "name",              limit: 255
    t.string "admin_title",       limit: 255
    t.text   "admin_description"
    t.text   "settings"
    t.index ["name"], name: "stylizer_name_key", unique: true, using: :btree
  end

  create_table "system", primary_key: "filename", id: :string, limit: 255, default: "", force: :cascade do |t|
    t.string  "name",           limit: 255, default: "", null: false
    t.string  "type",           limit: 12,  default: "", null: false
    t.string  "owner",          limit: 255, default: "", null: false
    t.integer "status",                     default: 0,  null: false
    t.integer "bootstrap",                  default: 0,  null: false
    t.integer "schema_version", limit: 2,   default: -1, null: false
    t.integer "weight",                     default: 0,  null: false
    t.binary  "info"
    t.index ["status", "bootstrap", "type", "weight", "name"], name: "system_system_list_idx", using: :btree
    t.index ["type", "name"], name: "system_type_name_idx", using: :btree
  end

  create_table "taxonomy_index", id: false, force: :cascade do |t|
    t.integer "nid",     limit: 8, default: 0, null: false
    t.integer "tid",     limit: 8, default: 0, null: false
    t.integer "sticky",  limit: 2, default: 0
    t.integer "created",           default: 0, null: false
    t.index ["nid"], name: "taxonomy_index_nid_idx", using: :btree
    t.index ["tid", "sticky", "created"], name: "taxonomy_index_term_node_idx", using: :btree
  end

  create_table "taxonomy_term_data", primary_key: "tid", force: :cascade do |t|
    t.integer "vid",         limit: 8,   default: 0,     null: false
    t.string  "name",        limit: 255, default: "",    null: false
    t.text    "description"
    t.string  "format",      limit: 255
    t.integer "weight",                  default: 0,     null: false
    t.string  "language",    limit: 12,  default: "und", null: false
    t.integer "i18n_tsid",   limit: 8,   default: 0,     null: false
    t.index ["name"], name: "taxonomy_term_data_name_idx", using: :btree
    t.index ["vid", "name"], name: "taxonomy_term_data_vid_name_idx", using: :btree
    t.index ["vid", "weight", "name"], name: "taxonomy_term_data_taxonomy_tree_idx", using: :btree
  end

  create_table "taxonomy_term_hierarchy", primary_key: ["tid", "parent"], force: :cascade do |t|
    t.integer "tid",    limit: 8, default: 0, null: false
    t.integer "parent", limit: 8, default: 0, null: false
    t.index ["parent"], name: "taxonomy_term_hierarchy_parent_idx", using: :btree
  end

  create_table "taxonomy_vocabulary", primary_key: "vid", force: :cascade do |t|
    t.string  "name",         limit: 255, default: "",    null: false
    t.string  "machine_name", limit: 255, default: "",    null: false
    t.text    "description"
    t.integer "hierarchy",                default: 0,     null: false
    t.string  "module",       limit: 255, default: "",    null: false
    t.integer "weight",                   default: 0,     null: false
    t.string  "language",     limit: 12,  default: "und", null: false
    t.integer "i18n_mode",    limit: 8,   default: 0,     null: false
    t.index ["machine_name"], name: "taxonomy_vocabulary_machine_name_key", unique: true, using: :btree
    t.index ["weight", "name"], name: "taxonomy_vocabulary_list_idx", using: :btree
  end

  create_table "url_alias", primary_key: "pid", force: :cascade do |t|
    t.string "source",   limit: 255, default: "", null: false
    t.string "alias",    limit: 255, default: "", null: false
    t.string "language", limit: 12,  default: "", null: false
    t.index ["alias", "language", "pid"], name: "url_alias_alias_language_pid_idx", using: :btree
    t.index ["source", "language", "pid"], name: "url_alias_source_language_pid_idx", using: :btree
  end

  create_table "user_import", primary_key: "import_id", force: :cascade do |t|
    t.string  "name",                  limit: 25,  default: "", null: false
    t.string  "auto_import_directory", limit: 255, default: "", null: false
    t.string  "filename",              limit: 50,  default: "", null: false
    t.string  "oldfilename",           limit: 50,  default: "", null: false
    t.text    "filepath",                                       null: false
    t.integer "started",                           default: 0,  null: false
    t.integer "pointer",                           default: 0,  null: false
    t.integer "processed",                         default: 0,  null: false
    t.integer "valid",                             default: 0,  null: false
    t.text    "field_match",                                    null: false
    t.text    "roles",                                          null: false
    t.text    "options",                                        null: false
    t.string  "setting",               limit: 10,  default: "", null: false
  end

  create_table "user_import_errors", id: false, force: :cascade do |t|
    t.integer "import_id", default: 0, null: false
    t.text    "data",                  null: false
    t.text    "errors",                null: false
    t.index ["import_id"], name: "user_import_errors_import_id_idx", using: :btree
  end

  create_table "users", primary_key: "uid", id: :integer, limit: 8, default: 0, force: :cascade do |t|
    t.string  "name",             limit: 60,  default: "", null: false
    t.string  "pass",             limit: 128, default: "", null: false
    t.string  "mail",             limit: 254, default: ""
    t.string  "theme",            limit: 255, default: "", null: false
    t.string  "signature",        limit: 255, default: "", null: false
    t.string  "signature_format", limit: 255
    t.integer "created",                      default: 0,  null: false
    t.integer "access",                       default: 0,  null: false
    t.integer "login",                        default: 0,  null: false
    t.integer "status",           limit: 2,   default: 0,  null: false
    t.string  "timezone",         limit: 32
    t.string  "language",         limit: 12,  default: "", null: false
    t.integer "picture",                      default: 0,  null: false
    t.string  "init",             limit: 254, default: ""
    t.binary  "data"
    t.index ["access"], name: "users_access_idx", using: :btree
    t.index ["created"], name: "users_created_idx", using: :btree
    t.index ["mail"], name: "users_mail_idx", using: :btree
    t.index ["name"], name: "users_name_key", unique: true, using: :btree
    t.index ["picture"], name: "users_picture_idx", using: :btree
  end

  create_table "users_roles", primary_key: ["uid", "rid"], force: :cascade do |t|
    t.integer "uid", limit: 8, default: 0, null: false
    t.integer "rid", limit: 8, default: 0, null: false
    t.index ["rid"], name: "users_roles_rid_idx", using: :btree
  end

  create_table "variable", primary_key: "name", id: :string, limit: 128, default: "", force: :cascade do |t|
    t.binary "value", null: false
  end

  create_table "views_display", primary_key: ["vid", "id"], force: :cascade do |t|
    t.integer "vid",             limit: 8,  default: 0,  null: false
    t.string  "id",              limit: 64, default: "", null: false
    t.string  "display_title",   limit: 64, default: "", null: false
    t.string  "display_plugin",  limit: 64, default: "", null: false
    t.integer "position",                   default: 0
    t.text    "display_options"
    t.index ["vid", "position"], name: "views_display_vid_idx", using: :btree
  end

  create_table "views_view", primary_key: "vid", force: :cascade do |t|
    t.string  "name",        limit: 128, default: "", null: false
    t.string  "description", limit: 255, default: ""
    t.string  "tag",         limit: 255, default: ""
    t.string  "base_table",  limit: 64,  default: "", null: false
    t.string  "human_name",  limit: 255, default: ""
    t.integer "core",                    default: 0
    t.index ["name"], name: "views_view_name_key", unique: true, using: :btree
  end

  create_table "watchdog", primary_key: "wid", force: :cascade do |t|
    t.integer "uid",                   default: 0,  null: false
    t.string  "type",      limit: 64,  default: "", null: false
    t.text    "message",                            null: false
    t.binary  "variables",                          null: false
    t.integer "severity",              default: 0,  null: false
    t.string  "link",      limit: 255, default: ""
    t.text    "location",                           null: false
    t.text    "referer"
    t.string  "hostname",  limit: 128, default: "", null: false
    t.integer "timestamp",             default: 0,  null: false
    t.index ["severity"], name: "watchdog_severity_idx", using: :btree
    t.index ["type"], name: "watchdog_type_idx", using: :btree
    t.index ["uid"], name: "watchdog_uid_idx", using: :btree
  end

  create_table "webform", primary_key: "nid", id: :integer, limit: 8, force: :cascade do |t|
    t.integer "next_serial",                      limit: 8,    default: 1,                null: false
    t.text    "confirmation",                                                             null: false
    t.string  "confirmation_format",              limit: 255
    t.string  "redirect_url",                     limit: 2048, default: "<confirmation>"
    t.integer "status",                           limit: 2,    default: 1,                null: false
    t.integer "block",                            limit: 2,    default: 0,                null: false
    t.integer "allow_draft",                      limit: 2,    default: 0,                null: false
    t.integer "auto_save",                        limit: 2,    default: 0,                null: false
    t.integer "submit_notice",                    limit: 2,    default: 1,                null: false
    t.string  "submit_text",                      limit: 255
    t.integer "submit_limit",                     limit: 2,    default: -1,               null: false
    t.integer "submit_interval",                               default: -1,               null: false
    t.integer "total_submit_limit",                            default: -1,               null: false
    t.integer "total_submit_interval",                         default: -1,               null: false
    t.integer "progressbar_bar",                  limit: 2,    default: 0,                null: false
    t.integer "progressbar_page_number",          limit: 2,    default: 0,                null: false
    t.integer "progressbar_percent",              limit: 2,    default: 0,                null: false
    t.integer "progressbar_pagebreak_labels",     limit: 2,    default: 0,                null: false
    t.integer "progressbar_include_confirmation", limit: 2,    default: 0,                null: false
    t.string  "progressbar_label_first",          limit: 255
    t.string  "progressbar_label_confirmation",   limit: 255
    t.integer "preview",                          limit: 2,    default: 0,                null: false
    t.string  "preview_next_button_label",        limit: 255
    t.string  "preview_prev_button_label",        limit: 255
    t.string  "preview_title",                    limit: 255
    t.text    "preview_message",                                                          null: false
    t.string  "preview_message_format",           limit: 255
    t.text    "preview_excluded_components",                                              null: false
  end

  create_table "webform_component", primary_key: ["nid", "cid"], force: :cascade do |t|
    t.integer "nid",      limit: 8,   default: 0, null: false
    t.integer "cid",                  default: 0, null: false
    t.integer "pid",                  default: 0, null: false
    t.string  "form_key", limit: 128
    t.text    "name",                             null: false
    t.string  "type",     limit: 16
    t.text    "value",                            null: false
    t.text    "extra",                            null: false
    t.integer "required", limit: 2,   default: 0, null: false
    t.integer "weight",   limit: 2,   default: 0, null: false
  end

  create_table "webform_conditional", primary_key: ["nid", "rgid"], force: :cascade do |t|
    t.integer "nid",         limit: 8,   default: 0, null: false
    t.integer "rgid",                    default: 0, null: false
    t.string  "andor",       limit: 128
    t.string  "action",      limit: 128
    t.string  "target_type", limit: 128
    t.string  "target",      limit: 128
    t.integer "weight",      limit: 2,   default: 0, null: false
  end

  create_table "webform_conditional_rules", primary_key: ["nid", "rgid", "rid"], force: :cascade do |t|
    t.integer "nid",         limit: 8,   default: 0, null: false
    t.integer "rgid",                    default: 0, null: false
    t.integer "rid",                     default: 0, null: false
    t.string  "source_type", limit: 128
    t.integer "source",                  default: 0, null: false
    t.string  "operator",    limit: 128
    t.text    "value"
  end

  create_table "webform_emails", primary_key: ["nid", "eid"], force: :cascade do |t|
    t.integer "nid",                 limit: 8, default: 0, null: false
    t.integer "eid",                           default: 0, null: false
    t.text    "email"
    t.text    "subject"
    t.text    "from_name"
    t.text    "from_address"
    t.text    "template"
    t.text    "excluded_components",                       null: false
    t.integer "html",                          default: 0, null: false
    t.integer "attachments",                   default: 0, null: false
    t.text    "extra",                                     null: false
  end

  create_table "webform_last_download", primary_key: ["nid", "uid"], force: :cascade do |t|
    t.integer "nid",       limit: 8, default: 0, null: false
    t.integer "uid",       limit: 8, default: 0, null: false
    t.integer "sid",       limit: 8, default: 0, null: false
    t.integer "requested", limit: 8, default: 0, null: false
  end

  create_table "webform_roles", primary_key: ["nid", "rid"], force: :cascade do |t|
    t.integer "nid", limit: 8, default: 0, null: false
    t.integer "rid", limit: 8, default: 0, null: false
  end

  create_table "webform_submissions", primary_key: "sid", force: :cascade do |t|
    t.integer "nid",         limit: 8,   default: 0, null: false
    t.integer "serial",      limit: 8,               null: false
    t.integer "uid",         limit: 8,   default: 0, null: false
    t.integer "is_draft",    limit: 2,   default: 0, null: false
    t.integer "submitted",               default: 0, null: false
    t.string  "remote_addr", limit: 128
    t.index ["nid", "serial"], name: "webform_submissions_nid_serial_key", unique: true, using: :btree
    t.index ["nid", "sid"], name: "webform_submissions_nid_sid_idx", using: :btree
    t.index ["nid", "uid", "sid"], name: "webform_submissions_nid_uid_sid_idx", using: :btree
    t.index ["sid", "nid"], name: "webform_submissions_sid_nid_key", unique: true, using: :btree
  end

  create_table "webform_submitted_data", primary_key: ["nid", "sid", "cid", "no"], force: :cascade do |t|
    t.integer "nid",  limit: 8,   default: 0,   null: false
    t.integer "sid",  limit: 8,   default: 0,   null: false
    t.integer "cid",              default: 0,   null: false
    t.string  "no",   limit: 128, default: "0", null: false
    t.text    "data",                           null: false
    t.index ["nid"], name: "webform_submitted_data_nid_idx", using: :btree
    t.index ["sid", "nid"], name: "webform_submitted_data_sid_nid_idx", using: :btree
  end

  create_table "wysiwyg", primary_key: "format", id: :string, limit: 255, force: :cascade do |t|
    t.string "editor",   limit: 128, default: "", null: false
    t.text   "settings"
  end

  create_table "wysiwyg_user", id: false, force: :cascade do |t|
    t.integer "uid",    limit: 8,   default: 0, null: false
    t.string  "format", limit: 255
    t.integer "status",             default: 0, null: false
    t.index ["format"], name: "wysiwyg_user_format_idx", using: :btree
    t.index ["uid"], name: "wysiwyg_user_uid_idx", using: :btree
  end

  create_table "xmlsitemap", primary_key: ["id", "type"], force: :cascade do |t|
    t.integer "id",                limit: 8,   default: 0,  null: false
    t.string  "type",              limit: 32,  default: "", null: false
    t.string  "subtype",           limit: 128, default: "", null: false
    t.string  "loc",               limit: 255, default: "", null: false
    t.string  "language",          limit: 12,  default: "", null: false
    t.integer "access",            limit: 2,   default: 1,  null: false
    t.integer "status",            limit: 2,   default: 1,  null: false
    t.integer "status_override",   limit: 2,   default: 0,  null: false
    t.integer "lastmod",           limit: 8,   default: 0,  null: false
    t.float   "priority"
    t.integer "priority_override", limit: 2,   default: 0,  null: false
    t.integer "changefreq",        limit: 8,   default: 0,  null: false
    t.integer "changecount",       limit: 8,   default: 0,  null: false
    t.index ["access", "status", "loc"], name: "xmlsitemap_access_status_loc_idx", using: :btree
    t.index ["language"], name: "xmlsitemap_language_idx", using: :btree
    t.index ["loc"], name: "xmlsitemap_loc_idx", using: :btree
    t.index ["type", "subtype"], name: "xmlsitemap_type_subtype_idx", using: :btree
  end

  create_table "xmlsitemap_sitemap", primary_key: "smid", id: :string, limit: 64, force: :cascade do |t|
    t.text    "context",                            null: false
    t.integer "updated",      limit: 8, default: 0, null: false
    t.integer "links",        limit: 8, default: 0, null: false
    t.integer "chunks",       limit: 8, default: 0, null: false
    t.integer "max_filesize", limit: 8, default: 0, null: false
  end

end
