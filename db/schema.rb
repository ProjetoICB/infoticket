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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20190122170314) do

  create_table "avisos", :force => true do |t|
    t.text     "quadro_de_avisos"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "chamados", :force => true do |t|
    t.string   "titulo"
    t.text     "descricao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "status"
    t.integer  "user_id"
    t.integer  "type_id"
    t.string   "sala"
    t.string   "predio"
    t.string   "tecnico"
    t.string   "patrimonio"
    t.text     "obs"
  end

  add_index "chamados", ["user_id"], :name => "index_chamados_on_user_id"

  create_table "comentarios", :force => true do |t|
    t.string   "tecnico"
    t.text     "conteudo"
    t.integer  "chamados_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "chamado_id"
    t.integer  "user_id"
    t.boolean  "respPorEmail"
  end

  add_index "comentarios", ["chamado_id"], :name => "index_comentarios_on_chamado_id"
  add_index "comentarios", ["chamados_id"], :name => "index_comentarios_on_chamados_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :default => "", :null => false
    t.text     "data"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "nome"
    t.string   "login"
    t.string   "senha"
    t.string   "email"
    t.string   "ramal"
    t.string   "departamento"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "auth_token"
    t.string   "senha_reset_token"
    t.datetime "senha_reset_sent_at"
    t.integer  "type_id"
    t.string   "sobrenome"
    t.string   "n_usp"
  end

end
