json.extract! medico, :id, :ci, :nro_registro, :nombre, :apellido, :direccion, :telefono, :celular, :fecha_naci, :correo, :contacto_familiar, :especialidade_id, :created_at, :updated_at
json.url medico_url(medico, format: :json)
