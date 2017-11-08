# == Schema Information
#
# Table name: sales
#
#  id         :integer          not null, primary key
#  number     :integer
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  state      :integer
#  user_id    :integer
#

class Sale < ApplicationRecord
	has_many :sale_details, inverse_of: :sale, dependent: :destroy
	has_many :insumos, through: :sale_details
	belongs_to :usuario
    belongs_to :paciente
    belongs_to :formas_pago
    belongs_to :pedido
      
     
    
	validates :number, presence: true
	validates :date, presence: true

	accepts_nested_attributes_for :sale_details, reject_if: :sale_detail_rejectable?,
									allow_destroy: true

	enum state: [:draft, :confirmed]

	def total
		details = self.sale_details

		total = 0.0
		details.flat_map do |d|
			total += d.qty * d.insumo.price
		end
		total
	end

def iva10
  details = self.sale_details
  iva10 = 0.0
  details.flat_map do |d|
  	iva10 += d.qty * d.price 
    end
      iva10
      iva=iva10/11
	end
  


	private


		def sale_detail_rejectable?(att)
		  att[:insumo_id].blank? || att[:qty].blank? || att[:price].blank? || att[:qty].to_f <= 0 || att[:price].to_f <= 0
		end
end
