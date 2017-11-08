# == Schema Information
#
# Table name: sale_details
#
#  id         :integer          not null, primary key
#  sale_id    :integer
#  number     :integer
#  item_id    :integer
#  qty        :integer
#  price      :decimal(8, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SaleDetail < ApplicationRecord
	belongs_to :sale
	belongs_to :insumo

	validates :insumo_id, presence: true
	validates :qty, presence: true
	validates :price, presence: true
    after_save :descontar_stock
	accepts_nested_attributes_for :insumo




	def subtotal
		self.qty ? qty * unit_price : 0
	end

    #guardar precio automatico si no se pone otro precio

    private 
    
    


    def descontar_stock
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
