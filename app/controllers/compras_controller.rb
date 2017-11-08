class ComprasController < ApplicationController
  before_action :set_compra, only: [:create, :show, :edit, :update, :destroy]
 PAGE_SIZE = 10
  # GET /compras
  # GET /compras.json
  def index
     # clear no saved sales:
    unsaved_compras = Compra.where(state: "draft", usuario: current_usuario)
    unsaved_compras.each do |compra|
      compra.destroy
    end
     @page = (params[:page] || 0).to_i
    @keywords = params[:keywords]

    search = Search.new(@page, PAGE_SIZE, @keywords, current_usuario)
    @compras, @number_of_pages = search.compras
  
  end

  # GET /compras/1
  # GET /compras/1.json
  def show
  end

  # GET /compras/new
  def new
    last_compra = Compra.where(state: "confirmed", usuario: current_usuario).maximum('number')
    number =  (last_compra != nil) ? last_compra + 1 : 1 
    proveedore_id =  (last_compra == nil) ? last_compra  : 1
    formas_pago_id =  (last_compra == nil) ? last_compra : 1
    @compra = Compra.create(date: Date::current,  number: number, proveedore_id: proveedore_id, formas_pago_id: formas_pago_id, state: "draft", usuario: current_usuario)
    @compra.compra_details.build
    params[:compra_id] = @compra.id.to_s
  end

  # GET /compras/1/edit
  def edit
  end

  # POST /compras
  # POST /compras.json
  def create
 
  end

  # PATCH/PUT /compras/1
  # PATCH/PUT /compras/1.json
  def update
   @compra.confirmed!
    respond_to do |format|
      if @compra.update(compra_params)
        format.html { redirect_to compras_url, notice: 'Venta actualizada.' }
        format.json { render :show, status: :ok, location: @compra }
      else
        format.html { render :edit }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /compras/1
  # DELETE /compras/1.json
  def destroy
    @compra.destroy
    respond_to do |format|
      format.html { redirect_to compras_url, notice: 'Compra eliminada!.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compra
      @compra = Compra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compra_params
      params.require(:compra).permit(:number, :date, :state, :usuario_id, :formas_pago_id, :proveedore_id, sale_details_attributes: [:id, :sale_id, :insumo_id, :number, :qty, :price, :_destroy] )
  
    end
end
