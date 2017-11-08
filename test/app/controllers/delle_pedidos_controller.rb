class DellePedidosController < ApplicationController
  before_action :set_delle_pedido, only: [:show, :edit, :update, :destroy]

  # GET /delle_pedidos
  # GET /delle_pedidos.json
  def index
    @delle_pedidos = DellePedido.all
  end

  # GET /delle_pedidos/1
  # GET /delle_pedidos/1.json
  def show
  end

  # GET /delle_pedidos/new
  def new
    @delle_pedido = DellePedido.new
  end

  # GET /delle_pedidos/1/edit
  def edit
  end

  # POST /delle_pedidos
  # POST /delle_pedidos.json
  def create
    @delle_pedido = DellePedido.new(delle_pedido_params)

    respond_to do |format|
      if @delle_pedido.save
        format.html { redirect_to @delle_pedido, notice: 'Delle pedido was successfully created.' }
        format.json { render :show, status: :created, location: @delle_pedido }
      else
        format.html { render :new }
        format.json { render json: @delle_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delle_pedidos/1
  # PATCH/PUT /delle_pedidos/1.json
  def update
    respond_to do |format|
      if @delle_pedido.update(delle_pedido_params)
        format.html { redirect_to @delle_pedido, notice: 'Delle pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @delle_pedido }
      else
        format.html { render :edit }
        format.json { render json: @delle_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delle_pedidos/1
  # DELETE /delle_pedidos/1.json
  def destroy
    @delle_pedido.destroy
    respond_to do |format|
      format.html { redirect_to delle_pedidos_url, notice: 'Delle pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delle_pedido
      @delle_pedido = DellePedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delle_pedido_params
      params.require(:delle_pedido).permit(:pedido_id, :insumo_id, :cantidad)
    end
end
