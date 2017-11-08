class Detallepedido < ApplicationRecord
  belongs_to :pedido
  belongs_to :insumo
 
  validates :solicitado, presence: { message: "Ingrese la cantidad solicitada" }
  validate :insumo_valido

 

  private
    def insumo_valido
      unless Insumo.exists?(self.insumo_id)
        errors.add(:msg, "El código #{self.insumo_id} no existe")
      end
    end

   
    

    def self.demanda_insumos
      Detallepedido.group(:insumo_id).order('count(*) desc').limit(7).count
    end
end
