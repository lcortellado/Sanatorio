class CompraDatail < ApplicationRecord
  belongs_to :insumo
  belongs_to :compra

    validates :insumo_id, presence: true
	validates :qty, presence: true
	validates :price, presence: true
    after_save :sumar_stock
	accepts_nested_attributes_for :insumo




	def subtotal
		self.qty ? qty * unit_price : 0
	end

    #guardar precio automatico si no se pone otro precio

    private 
    
    


    def sumar_stock
     self.insumo.stock += self.qty
     if insumo.stock > 0
     self.insumo.save
   else
   	 unless Insumo.exists?(self.insumo.stock)
   	errors.add(:msg, "stock de #{self.insumo_id} agotado")
    end
    end
    end

	def unit_price
    if insumo_id == insumo_id
      price = self.insumo.price
    else
      insumo ? insumo.price : 0
    end
  end
end
