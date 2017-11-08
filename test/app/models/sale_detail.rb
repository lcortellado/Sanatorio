class SaleDetail < ApplicationRecord
belongs_to :sale
	belongs_to :insumo
def insumo_descripcion
  insumo.try(:descripcion)
end

def insumo_descripcion=(descripcion)
  self.insumo = Insumo.find_by(descripcion: descripcion) if descripcion.present?
end
	validates :insumo_id, presence: true
	validates :qty, presence: true
	validates :price, presence: true

	accepts_nested_attributes_for :insumo


	def subtotal
		self.qty ? qty * unit_price : 0
	end

	def unit_price
		if persisted?
			price
		else
			insumo ? insumo.price : 0
		end
	end
end
