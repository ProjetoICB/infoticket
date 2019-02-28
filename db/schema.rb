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

ActiveRecord::Schema.define(:version => 20190226133744) do

  create_table "avisos", :force => true do |t|
    t.text     "quadro_de_avisos"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "chamados", :force => true do |t|
    t.string   "titulo"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.integer  "user_id"
    t.integer  "type_id"
    t.string   "sala"
    t.string   "predio"
    t.string   "tecnico"
    t.string   "patrimonio"
    t.text     "obs"
    t.integer  "usuario_id"
  end

  add_index "chamados", ["user_id"], :name => "index_chamados_on_user_id"

  create_table "comentarios", :force => true do |t|
    t.text     "conteudo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "chamado_id"
    t.integer  "user_id"
    t.boolean  "respPorEmail"
    t.integer  "usuario_id"
  end

  add_index "comentarios", ["chamado_id"], :name => "index_comentarios_on_chamado_id"

  create_table "logs", :force => true do |t|
    t.string   "acao"
    t.string   "ip"
    t.integer  "usuario_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "perfils", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "permitidos", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "perfil_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "sessions_old", :force => true do |t|
    t.string   "session_id", :default => "", :null => false
    t.text     "data"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "sessions_old", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions_old", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tipo_vinculos", :force => true do |t|
    t.string   "tipoVinculo"
    t.string   "codigoSetor"
    t.string   "nomeAbreviadSetor"
    t.string   "nomeSetor"
    t.string   "codigoUnidade"
    t.string   "siglaUnidade"
    t.string   "nomeUnidade"
    t.string   "nomeVinculo"
    t.string   "nomeAbreviadoFuncao"
    t.integer  "usuario_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

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

  create_table "usuarios", :force => true do |t|
    t.string   "nomeUsuario"
    t.string   "loginUsuario"
    t.string   "tipoUsuario"
    t.string   "emailPrincipalUsuario"
    t.string   "emailAlternativoUsuario"
    t.string   "emailUspUsuario"
    t.string   "numeroTelefoneFormatado"
    t.string   "ramalUsp"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

end
