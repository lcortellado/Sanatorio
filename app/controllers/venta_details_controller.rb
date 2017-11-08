class VentaDetailsController < ApplicationController
 before_action :set_venta, only: [:new, :create, :destroy]	

	def new
		@venta_details = @venta.venta_details.build
		@venta_details.insumo = Insumo.first
	end

	def create
		insumo_exists = false
		insumo_id = params[:venta_details][:insumo_id].to_i
		@venta.venta_details.each do |detail|
			if detail.insumo_id == insumo_id
				# Ya existe el item en la factura, agregar cantidad
				insumo_exists = true
				@venta_detail = detail
				@saved_venta_detail = detail.id
				break
			end
		end
		if 	insumo_exists
			
			@venta_detail.qty += params[:venta_details][:qty].to_i
			@venta_detail.price = params[:venta_details][:price].to_f
			@venta_detail.save!
		else
			venta_detail = VentaDetail.new(venta_details_params)
			if @venta.venta_details.last.nil?
				venta_detail.number = 1
			else
				venta_detail.number = @venta.venta_details.last.number + 1
			end
			@venta.venta_details << venta_detail
		end
		@venta.save!
	end

	def edit
		@venta_detail = VentaDetail.find(params[:id])
	end

	def update
	end

	def destroy
		@venta_detail = VentaDetail.find(params[:id])
		@venta_detail.destroy

		respond_to do |format|
			format.js { render layout: false }
		end
	end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venta
      @venta = Venta.find(params[:venta_id].to_i)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venta_details_params
      params.require(:venta_details).permit(:id, :venta_id, :insumo_id, :insumo_descripcion, :number, :qty, :price, :_destroy)
    end
end