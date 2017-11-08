class FactproveedoresController < ApplicationController
  def index
    @factproveedores = Factproveedore.all
  end

  def show
    @factproveedore = Factproveedore.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = FactproveedorePdf.new(@factproveedore)
        send_data pdf.render, filename: 'factproveedore.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  def new
    #@codigo = Pedido.buscar_numero
   
  end

  def create
      last_factproveedore = Factproveedore.where(state: "confirmed", usuario: current_usuario).maximum('codigo')
    codigo =  (last_factproveedore != nil) ? last_factproveedore + 1 : 1
    @factproveedore = Factproveedore.create(date: Date::current, codigo: codigo, state: "draft", usuario: current_usuario)
    10.times do
      @factproveedore.detallefactproveedores.build
    end
  end

  def destroy
    @factproveedore = Factproveedore.find(params[:id])
    @factproveedore.destroy
    redirect_to factproveedores_path
  end

  private
    def factproveedore_params
      params.require(:factproveedore).permit(:codigo, :sanatorio_id, :usuario_id, detallefactproveedores_attributes: [:stock, :cantidad, :precio, :insumo_id])
    end
end
