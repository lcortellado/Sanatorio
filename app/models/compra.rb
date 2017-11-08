class Compra < ApplicationRecord
    has_many :compra_details, inverse_of: :compra, dependent: :destroy
	has_many :insumos, through: :compra_details
	belongs_to :usuario
    belongs_to :proveedore, required: true
    belongs_to :formas_pago, required: true

    validates :proveedore_id, presence: false 
    validates :formas_pago_id, presence: false 
	validates :number, presence: true
	validates :date, presence: true

	accepts_nested_attributes_for :compra_details, reject_if: :compra_detail_rejectable?,
									allow_destroy: true

	enum state: [:draft, :confirmed]

	def total
		details = self.compra_details

		total = 0.0
		details.flat_map do |d|
			total += d.qty * d.price
		end
		total
	end

def iva10
  details = self.compra_details
  iva10 = 0.0
  details.flat_map do |d|
  	iva10 += d.qty * d.price 
    end
      iva10
      iva=iva10/11
	end
  


	private

def compra(att)
att[:proveedore_id].blank? || att[:formas_pago_id].blank?
end
		def compra_detail_rejectable?(att)
		  att[:insumo_id].blank? || att[:qty].blank? || att[:price].blank? || att[:qty].to_f <= 0 || att[:price].to_f <= 0
		end
end
