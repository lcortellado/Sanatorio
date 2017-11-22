class Sexo < ApplicationRecord
    has_many :pacientes
    has_many :medicos
end
