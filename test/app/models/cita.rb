class Cita < ApplicationRecord
  belongs_to :paciente
  belongs_to :medico
  belongs_to :estado
end
