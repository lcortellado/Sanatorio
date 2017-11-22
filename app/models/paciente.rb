# == Schema Information
#
# Table name: pacientes
#
#  id                :integer          not null, primary key
#  ci                :string(255)
#  nombre            :string(255)
#  apellido          :string(255)
#  direccion         :string(255)
#  telefono          :string(255)
#  celular           :string(255)
#  fecha_naci        :string(255)
#  correo            :string(255)
#  contacto_familiar :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Paciente < ApplicationRecord
    has_many :turnos
    has_many :internaciones
    has_many :reservas
    belongs_to :ciudade
    has_many :sales
    has_many :ventas
    def completo
         "#{nombre}" +".."+ "#{apellido}"
  end
end
