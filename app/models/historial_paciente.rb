class HistorialPaciente < ApplicationRecord
  belongs_to :reserva
    audited
end
