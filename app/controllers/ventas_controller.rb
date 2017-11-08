class VentasController < ApplicationController
  before_action :set_venta, only: [:create, :show, :edit, :update, :destroy]

  PAGE_SIZE = 10

  # GET /sales
  # GET /sales.json
  def index
    # clear no saved sales:
    unsaved_ventas = Venta.where(state: "draft", usuario: current_usuario)
    unsaved_ventas.each do |venta|
      venta.destroy
    end

   @page = (params[:page] || 0).to_i

   if params[:keywords].present?
     @keywords = params[:keywords]
     @ventas = Ventas.where("lower(number) LIKE '%#{@keywords.downcase}%'").order("number ASC" )
                    .offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = Venta.where("lower(number) LIKE '%#{@keywords.downcase}%'").count

       else
     @ventas = Venta.order('number ASC').offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = Venta.count
   end
   @number_of_pages = (number_of_records % PAGE_SIZE) == 0 ? 
                       number_of_records / PAGE_SIZE - 1 : number_of_records / PAGE_SIZE
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    last_venta = Venta.where(state: "confirmed", usuario: current_usuario).maximum('number')
    number =  (last_venta != nil) ? last_venta + 1 : 1 
    paciente_id = (last_venta == 0) ? last_venta : 1
    formas_pago_id = (last_venta == 0) ? last_venta : 1
   
    @venta = Venta.create(date: Date::current,  number: number, formas_pago_id: formas_pago_id, paciente_id: paciente_id, state: "draft", usuario: current_usuario)
    @venta.venta_details.build
    params[:venta_id] = @venta.id.to_s
  end

  # GET /sales/1/edit
  def edit
  end


  # POST /sales
  # POST /sales.json
  def create
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    @venta.confirmed!
    respond_to do |format|
      if @venta.update(venta_params)
        format.html { redirect_to ventas_url, notice: 'Venta actualizada.' }
        format.json { render :show, status: :ok, location: @venta }
      else
        format.html { render :edit }
        format.json { render json: @venta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Venta eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venta
      @venta = Venta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venta_params
      params.require(:venta).permit(:number, :formas_pago_id, :paciente_id, :date, sale_details_attributes: [:id, :venta_id, :insumo_id, :number, :qty, :price, :_destroy] )
    end
end