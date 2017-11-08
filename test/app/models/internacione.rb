# == Schema Information
#
# Table name: internaciones
#
#  id             :integer          not null, primary key
#  fechaIng       :date
#  horaIng        :time
#  fechaSalida    :date
#  horaSalida     :time
#  habitacione_id :integer
#  paciente_id    :integer
#  medico_id      :integer
#  totalGasto     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Internacione < ApplicationRecord
  belongs_to :habitacione
  belongs_to :paciente
  belongs_to :medico
end
