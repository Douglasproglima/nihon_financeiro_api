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

ActiveRecord::Schema.define(version: 20180619084139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conta", force: :cascade do |t|
    t.string   "nome"
    t.integer  "numero"
    t.integer  "agencia"
    t.decimal  "saldo",         precision: 10, scale: 2
    t.decimal  "saldo_inicial", precision: 10, scale: 2
    t.integer  "user_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["user_id"], name: "index_conta_on_user_id", using: :btree
  end

  create_table "empresas", force: :cascade do |t|
    t.string   "nome"
    t.string   "razao_social"
    t.string   "cnpj"
    t.string   "telefone"
    t.string   "telefone2"
    t.string   "contato"
    t.string   "email"
    t.boolean  "ativo",        default: true
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["user_id"], name: "index_empresas_on_user_id", using: :btree
  end

  create_table "grupo_conta", force: :cascade do |t|
    t.string   "nome"
    t.bigint   "referencia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "nome"
    t.string   "referencia"
    t.string   "tipo"
    t.integer  "subgrupo_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["subgrupo_id"], name: "index_items_on_subgrupo_id", using: :btree
  end

  create_table "movimento_conta", force: :cascade do |t|
    t.datetime "data"
    t.string   "centro_custo"
    t.decimal  "valor",          precision: 10, scale: 2
    t.decimal  "saldo_anterior", precision: 10, scale: 2
    t.string   "tipo"
    t.integer  "conta_id"
    t.integer  "user_id"
    t.integer  "movimento_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["conta_id"], name: "index_movimento_conta_on_conta_id", using: :btree
    t.index ["movimento_id"], name: "index_movimento_conta_on_movimento_id", using: :btree
    t.index ["user_id"], name: "index_movimento_conta_on_user_id", using: :btree
  end

  create_table "movimentos", force: :cascade do |t|
    t.datetime "data"
    t.string   "centro_custo"
    t.decimal  "valor",        precision: 10, scale: 2
    t.string   "observacao"
    t.string   "tipo"
    t.integer  "item_id"
    t.integer  "conta_id"
    t.integer  "user_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["conta_id"], name: "index_movimentos_on_conta_id", using: :btree
    t.index ["item_id"], name: "index_movimentos_on_item_id", using: :btree
    t.index ["user_id"], name: "index_movimentos_on_user_id", using: :btree
  end

  create_table "saldos", force: :cascade do |t|
    t.datetime "data"
    t.decimal  "saldo",      precision: 10, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "subgrupos", force: :cascade do |t|
    t.string   "nome"
    t.string   "referencia"
    t.integer  "grupo_conta_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["grupo_conta_id"], name: "index_subgrupos_on_grupo_conta_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "auth_token"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "conta", "users"
  add_foreign_key "empresas", "users"
  add_foreign_key "items", "subgrupos"
  add_foreign_key "movimento_conta", "conta", column: "conta_id"
  add_foreign_key "movimento_conta", "movimentos"
  add_foreign_key "movimento_conta", "users"
  add_foreign_key "movimentos", "conta", column: "conta_id"
  add_foreign_key "movimentos", "items"
  add_foreign_key "movimentos", "users"
  add_foreign_key "subgrupos", "grupo_conta", column: "grupo_conta_id"
end
