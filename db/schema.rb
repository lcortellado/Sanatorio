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

ActiveRecord::Schema.define(version: 20171119203852) do

  create_table "active_admin_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index"
    t.index ["auditable_id", "auditable_type"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "ciudades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "codigo"
    t.string "nombre"
    t.bigint "departamento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departamento_id"], name: "index_ciudades_on_departamento_id"
  end

  create_table "dashboards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departamentos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nombre"
    t.bigint "regione_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "codigo"
    t.index ["regione_id"], name: "index_departamentos_on_regione_id"
  end

  create_table "dias", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "codigo"
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "especialidades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historial_pacientes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "codigo"
    t.string "diagnostico"
    t.string "indicaciones"
    t.bigint "reserva_id"
    t.string "estudios"
    t.string "resultestudios"
    t.date "fecha_proxima_cita"
    t.string "recomendaciones"
    t.integer "precio"
    t.integer "descuento"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reserva_id"], name: "index_historial_pacientes_on_reserva_id"
  end

  create_table "horarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "codigo"
    t.bigint "medico_id"
    t.bigint "dia_id"
    t.time "horadesde"
    t.time "horahasta"
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dia_id"], name: "index_horarios_on_dia_id"
    t.index ["medico_id"], name: "index_horarios_on_medico_id"
  end

  create_table "medicos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ci"
    t.string "nro_registro"
    t.string "nombre"
    t.string "apellido"
    t.boolean "sexo"
    t.string "direccion"
    t.string "telefono"
    t.string "celular"
    t.date "fecha_naci"
    t.string "correo"
    t.string "contacto_familiar"
    t.bigint "especialidade_id"
    t.bigint "ciudade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ciudade_id"], name: "index_medicos_on_ciudade_id"
    t.index ["especialidade_id"], name: "index_medicos_on_especialidade_id"
  end

  create_table "pacientes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ci"
    t.string "nombre"
    t.string "apellido"
    t.boolean "sexo"
    t.string "direccion"
    t.string "telefono"
    t.string "celular"
    t.date "fecha_naci"
    t.string "correo"
    t.string "contacto_familiar"
    t.float "ciudade", limit: 53
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ciudade_id"
    t.index ["ciudade_id"], name: "index_pacientes_on_ciudade_id"
  end

  create_table "regiones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "codigo"
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "codigo"
    t.integer "nro"
    t.string "asunto"
    t.bigint "paciente_id"
    t.bigint "medico_id"
    t.date "fecha"
    t.time "hora"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medico_id"], name: "index_reservas_on_medico_id"
    t.index ["paciente_id"], name: "index_reservas_on_paciente_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.string "role", default: "seller"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ciudades", "departamentos"
  add_foreign_key "departamentos", "regiones"
  add_foreign_key "historial_pacientes", "reservas"
  add_foreign_key "horarios", "dias"
  add_foreign_key "horarios", "medicos"
  add_foreign_key "medicos", "ciudades"
  add_foreign_key "medicos", "especialidades"
  add_foreign_key "pacientes", "ciudades"
  add_foreign_key "reservas", "medicos"
  add_foreign_key "reservas", "pacientes"
end
