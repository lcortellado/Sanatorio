class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]

  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = Pedido.all
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
     @pedido = Pedido.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PedidoPdf.new(@pedido)
        send_data pdf.render, filename: 'pedido.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
    10.times do
      @pedido.detallepedidos.build
    end
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
     @pedido = Pedido.new(pedido_params)
    @pedido.codigo = Pedido.generar_folio
    if @pedido.save
      redirect_to @pedido
    else
      render 'new'
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'Pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end
 def pedido_params
      params.require(:pedido).permit(:codigo, :proveedore_id, :usuario_id, detallepedidos_attributes: [:solicitado, :surtido, :insumo_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    
end
