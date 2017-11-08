class Detallefactproveedore < ActiveRecord::Base
  belongs_to :insumo
  belongs_to :factproveedore

  validates :cantidad, presence: { message: "Ingrese la cantidad que se esta enviado(surtido)" }
  validates :precio, presence: { message: "Ingrese la cantidad solicitada" }
  validate :insumo_valido

 
accepts_nested_attributes_for :insumo
  private
    def insumo_valido
      unless Insumo.exists?(self.insumo_id)
        errors.add(:msg, "El código #{self.articulo_id} no existe")
      end
    end

    

    def self.demanda_insumos
      Detallefactproveedore.group(:insumo_id).order('count(*) desc').limit(7).count
    end


    def subtotal
    self.cantidad ? cantidad * unit_precio : 0
  end

  def unit_price
    if persisted?
      precio
    else
      insumo ? insumo.precio_venta : 0
    end
  end
end
