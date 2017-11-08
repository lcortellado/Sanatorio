class CompraDatailsController < ApplicationController
  before_action :set_compra_datail, only: [:show, :edit, :update, :destroy]

  # GET /compra_datails
  # GET /compra_datails.json
 def new
    @compra_details = @compra.compra_details.build
    @compra_details.insumo = Insumo.first
  end

  def create
    insumo_exists = false
    insumo_id = params[:compra_details][:insumo_id].to_i
    @compra.compra_details.each do |detail|
      if detail.insumo_id == insumo_id
        # Ya existe el item en la factura, agregar cantidad
        insumo_exists = true
        @compra_detail = detail
        @saved_compra_detail = detail.id
        break
      end
    end
    if  insumo_exists
      
      @compra_detail.qty += params[:compra_details][:qty].to_i
      @compra_detail.price = params[:compra_details][:price].to_f
      @compra_detail.save!
    else
      compra_detail = CompraDetail.new(compra_details_params)
      if @compra.compra_details.last.nil?
        compra_detail.number = 1
      else
        compra_detail.number = @compra.compra_details.last.number + 1
      end
      @compra.compra_details << compra_detail
    end
    @compra.save!
  end

  def edit
    @compra_detail = CompraDetail.find(params[:id])
  end

  def update
  end

  def destroy
    @compra_detail = CompraDetail.find(params[:id])
    @compra_detail.destroy

    respond_to do |format|
      format.js { render layout: false }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compra
       @compra = Compra.find(params[:compra_id].to_i)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compra_datail_params
      params.require(:compra_datail).permit(:id, :compra_id, :insumo_descripcion, :number, :insumo_id, :qty, :price, :_destroy)
        
    end
end
