class Departamento < ApplicationRecord
  belongs_to :regione
  has_many :ciudades
    validates :nombre, presence: true
    validates :nombre,uniqueness:{ message: 'no puede estar repetido'}, presence: { message: " campo obligatorio"}
   validates :codigo, uniqueness:{ message: 'no puede estar repetido'}, presence: { message: " campo obligatorio"},
  
  length: {minimum: 1, maximum: 10, :message => "El título debe tener entre 3 y 10 caracteres"}, :numericality => {:only_integer => true, :message => "La prioridad debe ser numérica"}
end
