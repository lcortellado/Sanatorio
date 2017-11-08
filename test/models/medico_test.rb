# == Schema Information
#
# Table name: medicos
#
#  id                :integer          not null, primary key
#  ci                :string(255)
#  nro_registro      :string(255)
#  nombre            :string(255)
#  apellido          :string(255)
#  direccion         :string(255)
#  telefono          :string(255)
#  celular           :string(255)
#  fecha_naci        :string(255)
#  correo            :string(255)
#  contacto_familiar :string(255)
#  especialidade_id  :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class MedicoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
