json.extract! paciente, :id, :ci, :nombre, :apellido, :direccion, :telefono, :celular, :fecha_naci, :correo, :contacto_familiar, :created_at, :updated_at
json.url paciente_url(paciente, format: :json)
