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

ActiveRecord::Schema.define(version: 20141013153135) do

  create_table "articles", force: true do |t|
    t.integer  "articleId"
    t.integer  "managerId"
    t.date     "publicationDate"
    t.string   "body"
    t.string   "summary"
    t.boolean  "articleState"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bicicleta", force: true do |t|
    t.integer "idProducto"
    t.string  "referenciaProducto", limit: 10
    t.string  "nombreProducto",     limit: 50
    t.string  "marcaProducto",      limit: 50
    t.string  "imagenProducto",     limit: 100
    t.integer "valorProducto"
    t.boolean "estadoProducto"
    t.text    "descripcion"
    t.string  "medidas",            limit: 50
    t.string  "tipoBicicleta",      limit: 50
  end

  create_table "clientes", force: true do |t|
    t.integer "idPersona"
    t.integer "documento"
    t.string  "nombrePersona",     limit: 50
    t.string  "apellido",          limit: 50
    t.string  "telefono",          limit: 20
    t.boolean "estadoPersona"
    t.date    "fechaNacimiento"
    t.boolean "permisoPublicidad"
  end

  create_table "equipaciones", force: true do |t|
    t.integer "idProducto"
    t.string  "referenciaProducto", limit: 10
    t.string  "nombreProducto",     limit: 50
    t.string  "marcaProducto",      limit: 50
    t.string  "imagenProducto",     limit: 100
    t.integer "valorProducto"
    t.boolean "estadoProducto"
    t.string  "descripcion",        limit: 300
    t.string  "talla",              limit: 2
    t.string  "genero",             limit: 1
  end

  create_table "gerentes", force: true do |t|
    t.integer  "idPersona"
    t.integer  "documento"
    t.string   "nombrePersona",          limit: 50
    t.string   "apellido",               limit: 50
    t.string   "telefono",               limit: 20
    t.boolean  "estadoPersona"
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "gerentes", ["email"], name: "index_gerentes_on_email", unique: true, using: :btree
  add_index "gerentes", ["reset_password_token"], name: "index_gerentes_on_reset_password_token", unique: true, using: :btree

  create_table "historial_contratos", force: true do |t|
    t.integer "idPersona"
    t.date    "fechaContrato"
    t.date    "fechaFinContrato"
  end

  create_table "inventarios", force: true do |t|
    t.integer "cantidadProductos"
    t.integer "idProducto"
  end

  create_table "items", force: true do |t|
    t.integer "idVenta"
    t.integer "idProducto"
    t.integer "cantidadItem"
  end

  create_table "noticia", force: true do |t|
    t.integer "idNoticia"
    t.integer "idGerente"
    t.date    "fechaPublicacion"
    t.text    "cuerpo"
    t.text    "resumen"
    t.boolean "estadoNoticia"
  end

  create_table "repuesto_accesorios", force: true do |t|
    t.integer "idProducto"
    t.string  "referenciaProducto", limit: 10
    t.string  "nombreProducto",     limit: 50
    t.string  "marcaProducto",      limit: 50
    t.string  "imagenProducto",     limit: 100
    t.integer "valorProducto"
    t.boolean "estadoProducto"
    t.string  "descripcion",        limit: 300
    t.string  "tipoElemento",       limit: 10
  end

  create_table "vendedores", force: true do |t|
    t.integer  "idPersona"
    t.integer  "documento"
    t.string   "nombrePersona",          limit: 50
    t.string   "apellido",               limit: 50
    t.string   "telefono",               limit: 20
    t.boolean  "estadoPersona"
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "vendedores", ["email"], name: "index_vendedores_on_email", unique: true, using: :btree
  add_index "vendedores", ["reset_password_token"], name: "index_vendedores_on_reset_password_token", unique: true, using: :btree

  create_table "venta", force: true do |t|
    t.integer "idVenta"
    t.integer "idVendedor"
    t.integer "idCliente"
    t.date    "fechaVenta"
    t.boolean "estadoVenta"
    t.text    "observaciones"
  end

end
