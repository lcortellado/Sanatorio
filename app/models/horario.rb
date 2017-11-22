class Horario < ApplicationRecord
  belongs_to :medico
  belongs_to :dia
    audited
end
