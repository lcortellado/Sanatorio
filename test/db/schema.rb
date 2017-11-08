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

ActiveRecord::Schema.define(version: 20170927200552) do

  create_table "barrios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.bigint "distrito_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["distrito_id"], name: "index_barrios_on_distrito_id"
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "citas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "asunto"
    t.bigint "paciente_id"
    t.bigint "medico_id"
    t.string "nro_orden"
    t.date "fecha"
    t.string "nota"
    t.bigint "estado_id"
    t.string "estadoPago"
    t.integer "costo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estado_id"], name: "index_citas_on_estado_id"
    t.index ["medico_id"], name: "index_citas_on_medico_id"
    t.index ["paciente_id"], name: "index_citas_on_paciente_id"
  end

  create_table "ciudades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.bigint "departamento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "codigo"
    t.bigint "ciudade_id"
    t.index ["ciudade_id"], name: "index_ciudades_on_ciudade_id"
    t.index ["departamento_id"], name: "index_ciudades_on_departamento_id"
  end

  create_table "consults", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "turno_id"
    t.bigint "tipo_consult_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tipo_consult_id"], name: "index_consults_on_tipo_consult_id"
    t.index ["turno_id"], name: "index_consults_on_turno_id"
  end

  create_table "delle_pedidos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "pedido_id"
    t.bigint "insumo_id"
    t.integer "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insumo_id"], name: "index_delle_pedidos_on_insumo_id"
    t.index ["pedido_id"], name: "index_delle_pedidos_on_pedido_id"
  end

  create_table "departamentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.bigint "regione_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "codigo"
    t.index ["regione_id"], name: "index_departamentos_on_regione_id"
  end

  create_table "detalle_internaciones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "descripcion"
    t.string "cantidad"
    t.integer "preciouni"
    t.integer "subtotal"
    t.date "fecha"
    t.time "hora"
    t.bigint "internacione_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["internacione_id"], name: "index_detalle_internaciones_on_internacione_id"
  end

  create_table "dias", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "codigo"
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dias_has_horarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "dia_id"
    t.bigint "horario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dia_id"], name: "index_dias_has_horarios_on_dia_id"
    t.index ["horario_id"], name: "index_dias_has_horarios_on_horario_id"
  end

  create_table "distritos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.bigint "departamento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departamento_id"], name: "index_distritos_on_departamento_id"
  end

  create_table "especialidades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estados", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "decripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.date "start"
    t.date "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formas_pagos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "habitaciones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "descripcion"
    t.string "nrohabit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historia_pacientes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "diagnostico"
    t.string "indicaciones"
    t.date "fecha_proxima_cita"
    t.string "recomendaciones"
    t.bigint "reserva_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reserva_id"], name: "index_historia_pacientes_on_reserva_id"
  end

  create_table "horarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "medico_id"
    t.bigint "dia_id"
    t.time "horadesde"
    t.time "horahasta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "codigo"
    t.index ["dia_id"], name: "index_horarios_on_dia_id"
    t.index ["medico_id"], name: "index_horarios_on_medico_id"
  end

  create_table "horas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "codigo"
    t.time "horas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insumos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "descripcion"
    t.integer "precio_compra"
    t.integer "precio_venta"
    t.integer "stock"
    t.integer "stock_minimo"
    t.bigint "unidades_medida_id"
    t.bigint "proveedore_id"
    t.bigint "tipo_iva_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "codigo"
    t.string "nombre"
    t.index ["proveedore_id"], name: "index_insumos_on_proveedore_id"
    t.index ["tipo_iva_id"], name: "index_insumos_on_tipo_iva_id"
    t.index ["unidades_medida_id"], name: "index_insumos_on_unidades_medida_id"
  end

  create_table "internaciones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "fechaIng"
    t.time "horaIng"
    t.date "fechaSalida"
    t.time "horaSalida"
    t.bigint "habitacione_id"
    t.bigint "paciente_id"
    t.bigint "medico_id"
    t.integer "totalGasto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["habitacione_id"], name: "index_internaciones_on_habitacione_id"
    t.index ["medico_id"], name: "index_internaciones_on_medico_id"
    t.index ["paciente_id"], name: "index_internaciones_on_paciente_id"
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code"
    t.string "description"
    t.bigint "brand_id"
    t.bigint "unidades_medida_id"
    t.bigint "proveedore_id"
    t.integer "stock"
    t.integer "stock_minimo"
    t.integer "pcompra"
    t.integer "pventa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["proveedore_id"], name: "index_items_on_proveedore_id"
    t.index ["unidades_medida_id"], name: "index_items_on_unidades_medida_id"
  end

  create_table "line_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.decimal "unit_price", precision: 10
    t.integer "quantity"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_line_items_on_order_id"
  end

  create_table "medicos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ci"
    t.string "nro_registro"
    t.string "nombre"
    t.string "apellido"
    t.string "direccion"
    t.string "telefono"
    t.string "celular"
    t.string "fecha_naci"
    t.string "correo"
    t.string "contacto_familiar"
    t.bigint "especialidade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "fecha"
    t.bigint "ciudade_id"
    t.index ["ciudade_id"], name: "index_medicos_on_ciudade_id"
    t.index ["especialidade_id"], name: "index_medicos_on_especialidade_id"
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "order_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pacientes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ci"
    t.string "nombre"
    t.string "apellido"
    t.string "direccion"
    t.string "telefono"
    t.string "celular"
    t.string "fecha_naci"
    t.string "correo"
    t.string "contacto_familiar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ciudade_id"
    t.bigint "usuario_id"
    t.date "fecha"
    t.index ["ciudade_id"], name: "index_pacientes_on_ciudade_id"
    t.index ["usuario_id"], name: "index_pacientes_on_usuario_id"
  end

  create_table "pais", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pedidos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "codigo"
    t.date "fecha"
    t.bigint "proveedore_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proveedore_id"], name: "index_pedidos_on_proveedore_id"
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects_workers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "project_id"
    t.bigint "worker_id"
    t.index ["project_id"], name: "index_projects_workers_on_project_id"
    t.index ["worker_id"], name: "index_projects_workers_on_worker_id"
  end

  create_table "proveedores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "cedula"
    t.string "nombre"
    t.string "apellido"
    t.bigint "ciudade_id"
    t.string "direccion"
    t.string "empresa"
    t.string "telefono"
    t.string "celular"
    t.string "correo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ciudade_id"], name: "index_proveedores_on_ciudade_id"
  end

  create_table "regiones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "codigo"
  end

  create_table "reservas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "asunto"
    t.bigint "paciente_id"
    t.bigint "medico_id"
    t.date "fecha"
    t.time "hora"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "codigo"
    t.integer "nro"
    t.index ["medico_id"], name: "index_reservas_on_medico_id"
    t.index ["paciente_id"], name: "index_reservas_on_paciente_id"
  end

  create_table "sale_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "sale_id"
    t.integer "number"
    t.integer "item_id"
    t.integer "qty"
    t.decimal "price", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "insumo_id"
  end

  create_table "sales", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "number"
    t.date "date"
    t.integer "state"
    t.integer "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sanatorios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.string "direccion"
    t.string "telefono1"
    t.string "telefono2"
    t.string "telefon3"
    t.string "pagina"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_consulta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_consults", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_ivas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "decripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turno_dia", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turnos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "turno_nro"
    t.bigint "paciente_id"
    t.bigint "medico_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medico_id"], name: "index_turnos_on_medico_id"
    t.index ["paciente_id"], name: "index_turnos_on_paciente_id"
  end

  create_table "unidades_medidas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.datetime "date_of_birth"
    t.boolean "is_female", default: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["name"], name: "name", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  create_table "venta_detalles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "venta_id"
    t.integer "numero"
    t.bigint "insumo_id"
    t.integer "cantidad"
    t.integer "precio"
    t.integer "iva5"
    t.integer "exenta"
    t.integer "iva10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insumo_id"], name: "index_venta_detalles_on_insumo_id"
    t.index ["venta_id"], name: "index_venta_detalles_on_venta_id"
  end

  create_table "ventas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "codigo"
    t.integer "numero"
    t.date "fecha"
    t.integer "estado"
    t.bigint "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_ventas_on_usuario_id"
  end

  create_table "workers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "barrios", "distritos"
  add_foreign_key "citas", "estados"
  add_foreign_key "citas", "medicos"
  add_foreign_key "citas", "pacientes"
  add_foreign_key "ciudades", "ciudades"
  add_foreign_key "ciudades", "departamentos"
  add_foreign_key "consults", "tipo_consults"
  add_foreign_key "consults", "turnos"
  add_foreign_key "delle_pedidos", "insumos"
  add_foreign_key "delle_pedidos", "pedidos"
  add_foreign_key "departamentos", "regiones"
  add_foreign_key "detalle_internaciones", "internaciones"
  add_foreign_key "dias_has_horarios", "dia"
  add_foreign_key "dias_has_horarios", "horarios"
  add_foreign_key "distritos", "departamentos"
  add_foreign_key "historia_pacientes", "reservas"
  add_foreign_key "horarios", "dias"
  add_foreign_key "horarios", "medicos"
  add_foreign_key "insumos", "proveedores"
  add_foreign_key "insumos", "tipo_ivas"
  add_foreign_key "insumos", "unidades_medidas"
  add_foreign_key "internaciones", "habitaciones"
  add_foreign_key "internaciones", "medicos"
  add_foreign_key "internaciones", "pacientes"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "proveedores"
  add_foreign_key "items", "unidades_medidas"
  add_foreign_key "line_items", "orders"
  add_foreign_key "medicos", "ciudades"
  add_foreign_key "medicos", "especialidades"
  add_foreign_key "pacientes", "ciudades"
  add_foreign_key "pacientes", "usuarios"
  add_foreign_key "pedidos", "proveedores"
  add_foreign_key "proveedores", "ciudades"
  add_foreign_key "reservas", "medicos"
  add_foreign_key "reservas", "pacientes"
  add_foreign_key "turnos", "medicos"
  add_foreign_key "turnos", "pacientes"
  add_foreign_key "venta_detalles", "insumos"
  add_foreign_key "venta_detalles", "venta", column: "venta_id"
  add_foreign_key "ventas", "usuarios"
end
