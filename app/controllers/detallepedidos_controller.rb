class DetallepedidosController < ApplicationController
  before_action :set_detallepedido, only: [:show, :edit, :update, :destroy]

   def create
     @pedido = Pedido.new
    insumo_exists = false
    insumo_id = params[:detallepedidos][:insumo_id].to_i
    @pedido.detallepedidos.each do |detalle|
      if detalle.insumo_id == insumo_id
        # Ya existe el item en la factura, agregar cantidad
        insumo_exists = true
        @detllepedido = detalle
        @saved_detallepedido = detalle.id
        
      end
    end
    if insumo_exists
      @sale_detail.qty += params[:sale_details][:qty].to_i
      @sale_detail.price = params[:sale_details][:price].to_f
      @sale_detail.save!
   else
    @pedido_insumo = @pedido.detallepedidos.find(pedido_params)
    @pedido.save
  end
  end


  private
    def pedido_params
      params.require(:detallepedido).permit(:solicitado, :surtido, :proveedore_id, :usuario_id, :insumo_id)
      #code
    end

end
  