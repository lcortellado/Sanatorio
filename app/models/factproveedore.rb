class Factproveedore < ActiveRecord::Base
  has_many :detallefactproveedores, dependent: :destroy
  has_many :insumos, through: :detallefactproveedores
  belongs_to :sanatorio
  belongs_to :usuario
  validate :total
  validates :sanatorio_id, presence: { message: "Debe seleccionar un Titular" }

  accepts_nested_attributes_for :detallefactproveedores, :reject_if => lambda { |c| c[:insumo_id].blank?}


  private

  def detallefactproveedore_rejectable?(att)
			att[:insumo_id].blank? || att[:cantidad].blank? || att[:precio_venta].blank? || att[:cantidad].to_f <= 0 || att[:precio_venta].to_f <= 0
		end
    def self.generar_folio
      time, numero_random = Time.new, Random.new
      orden = time.strftime("%Y%m%d") + "#{numero_random.rand(100)}"
      if Factproveedore.exists?(codigo: orden)
        generar_folio
      else
        orden
      end
    end

    def self.recientes
      Factproveedore.order("created_at DESC").limit(9)
    end

def total

		details = self.detallefactproveedores

		total = 0.0
		details.flat_map do |d|
			total += d.cantidad * d.precio_venta
		end
		total
	end



		
end
