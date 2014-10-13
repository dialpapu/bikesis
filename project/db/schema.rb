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

ActiveRecord::Schema.define(version: 20141013025434) do

  create_table "bicicleta", force: true do |t|
    t.integer  "idProducto"
    t.string   "referenciaProducto", limit: 10
    t.string   "nombreProducto",     limit: 50
    t.string   "marcaProducto",      limit: 50
    t.string   "imagenProducto",     limit: 100
    t.integer  "valorProducto"
    t.string   "descripcion",        limit: 300
    t.string   "medidas",            limit: 50
    t.string   "tipoBicicleta",      limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clientes", force: true do |t|
    t.integer  "idPersona"
    t.integer  "documento"
    t.string   "nombrePersona",     limit: 50
    t.string   "apellido",          limit: 50
    t.string   "eMail",             limit: 50
    t.string   "telefono",          limit: 20
    t.date     "fechaNacimiento"
    t.boolean  "permisoPublicidad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gerentes", force: true do |t|
    t.integer  "idPersona"
    t.integer  "documento"
    t.string   "nombrePersona", limit: 50
    t.string   "apellido",      limit: 50
    t.string   "eMail",         limit: 50
    t.string   "telefono",      limit: 20
    t.boolean  "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "historial_contratos", force: true do |t|
    t.integer  "idPersona"
    t.date     "fechaContrato"
    t.date     "fechaFinContrato"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventarios", force: true do |t|
    t.integer  "cantidadInventario"
    t.integer  "idProducto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "idVenta"
    t.string   "idProducto_integer"
    t.integer  "cantidadItem"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "noticia", force: true do |t|
    t.integer  "idNoticia"
    t.integer  "idGerente"
    t.date     "fechaPublicacion"
    t.text     "cuerpo"
    t.text     "resumen"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repuesto_accesorios", force: true do |t|
    t.integer  "idProducto"
    t.string   "referenciaProducto", limit: 10
    t.string   "nombreProducto",     limit: 50
    t.string   "marcaProducto",      limit: 50
    t.string   "imagenProducto",     limit: 100
    t.integer  "valorProducto"
    t.string   "descripcion",        limit: 300
    t.string   "tipoElemento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ropadeportiva", force: true do |t|
    t.integer  "idProducto"
    t.string   "referenciaProducto", limit: 10
    t.string   "nombreProducto",     limit: 50
    t.string   "marcaProducto",      limit: 50
    t.string   "imagenProducto",     limit: 100
    t.integer  "valorProducto"
    t.string   "descripcion",        limit: 300
    t.string   "talla",              limit: 2
    t.string   "genero",             limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendedores", force: true do |t|
    t.integer  "idPersona"
    t.integer  "documento"
    t.string   "nombrePersona", limit: 50
    t.string   "apellido",      limit: 50
    t.string   "eMail",         limit: 50
    t.string   "telefono",      limit: 20
    t.boolean  "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ventas", force: true do |t|
    t.integer  "idVenta"
    t.integer  "idVendedor"
    t.integer  "idCliente"
    t.date     "fechaVenta"
    t.string   "observaciones", limit: 300
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
