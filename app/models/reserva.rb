class Reserva < ApplicationRecord
  belongs_to :paciente
  belongs_to :medico
    validates :nro, presence: true
    validates :paciente_id, presence: true
    validates :medico_id, presence: true
end
