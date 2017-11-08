class Venta < ApplicationRecord
 
    
    has_many :venta_details, inverse_of: :venta, dependent: :destroy
	has_many :insumos, through: :venta_details
	belongs_to :usuario
    belongs_to :paciente
    belongs_to :formas_pago
   
      
     
    
	validates :number, presence: true
	validates :date, presence: true

	accepts_nested_attributes_for :venta_details, reject_if: :venta_detail_rejectable?,
									allow_destroy: true

	enum state: [:draft, :confirmed]

	def total
		details = self.venta_details

		total = 0.0
		details.flat_map do |d|
			total += d.qty * d.insumo.price
		end
		total
	end

def iva10
  details = self.venta_details
  iva10 = 0.0
  details.flat_map do |d|
  	iva10 += d.qty * d.price 
    end
      iva10
      iva=iva10/11
	end
  


	private


		def venta_detail_rejectable?(att)
		  att[:insumo_id].blank? || att[:qty].blank? || att[:price].blank? || att[:qty].to_f <= 0 || att[:price].to_f <= 0
		end
end
