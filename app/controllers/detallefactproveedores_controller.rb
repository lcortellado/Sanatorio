class DetallefactproveedoresController < ApplicationController
  before_action :set_detallefactproveedore, only: [:show, :edit, :update, :destroy]

  # GET /detallefactproveedores
  # GET /detallefactproveedores.json
  def new
    @detallefactproveedores = @factproveedore.detallefactproveedores.build
    @detallefactproveedores.insumo = Insumo.first
  end

  def create
    @factproveedore = Factproveedore.new
    @factproveedore_insumo = @factproveedore.detallefactproveedores.find(factproveedore_params)
    @factproveedore.save
  
insumo_exists = false
    insumo_id = params[:detallefactproveedores][:insumo_id].to_i
    @factproveedore.detallefactproveedores.each do |detalle|
      if detalle.insumo_id == insumo_id
        # Ya existe el item en la factura, agregar cantidad
        insumo_exists = true
        @detallefactproveedore = detalle
        @saved_detallefactproveedore = detalle.id
        break
      end
    end
    if insumo_exists
      @detallefacproveedore.cantidad += params[:detallefactproveedore][:cantidad].to_i
      @detallefactproveedore.precio = params[:detallefactproveedore][:precio].to_f
      @detallefactproveedore.save!
    else
      detallefactproveedore = Detallefactproveedore.new(detallefactproveedores_params)
      if @factproveedore.detallefactproveedores.last.nil?
        detallefactproveedore.codigo = 1
      else
        detallefactproveedore.codgio = @factproveedore.detallefactproveedores.last.codigo + 1
      end
      @factproveedore.detallefactproveedores << detallefactproveedore
    end
    @factproveedore.save!

  end
  def set_factproveedore
      @factproveedore = Factproveedore.find(params[:factproveedore_id].to_i)
    end
 
  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def factproveedore_params
      params.require(:detallefactproveedore).permit(:number, :insumo_id, :cantidad, :sanatorio_id, :precio, :usuario_id)
    end
end
