class Ciudade < ApplicationRecord
  belongs_to :departamento
  has_many :proveedores
  has_many :pacientes
  has_many :medicos
    validates :nombre, presence: true
    
     validates :codigo, uniqueness:{ message: 'no puede estar repetido'}, presence: { message: " campo obligatorio"},
  
  length: {minimum: 1, maximum: 10, :message => "El título debe tener entre 3 y 10 caracteres"}, :numericality => {:only_integer => true, :message => "codigo debe ser numérica"}



end