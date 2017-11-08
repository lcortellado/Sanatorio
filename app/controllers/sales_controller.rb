class SalesController < ApplicationController
  before_action :set_sale, only: [:create, :show, :edit, :update, :destroy]
  PAGE_SIZE = 10

  # GET /sales
  # GET /sales.json
  def index
    # clear no saved sales:
    unsaved_sales = Sale.where(state: "draft", usuario: current_usuario)
    unsaved_sales.each do |sale|
      sale.destroy
    end

   @page = (params[:page] || 0).to_i

   if params[:keywords].present?
     @keywords = params[:keywords]
     @sales = Sales.where("lower(number) LIKE '%#{@keywords.downcase}%'").order("number ASC" )
                    .offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = Sale.where("lower(number) LIKE '%#{@keywords.downcase}%'").count

       else
     @sales = Sale.order('number ASC').offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = Sale.count
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
    last_sale = Sale.where(state: "confirmed", usuario: current_usuario).maximum('number')
    number =  (last_sale != nil) ? last_sale + 1 : 1 
    paciente_id = (last_sale == 0) ? last_sale : 1
    formas_pago_id = (last_sale == 0) ? last_sale : 1
    pedido_id = (last_sale == 0) ? last_sale : 1
    @sale = Sale.create(date: Date::current,  number: number, formas_pago_id: formas_pago_id, pedido_id: pedido_id, paciente_id: paciente_id, state: "draft", usuario: current_usuario)
    @sale.sale_details.build
    params[:sale_id] = @sale.id.to_s
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
    @sale.confirmed!
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to sales_url, notice: 'Venta actualizada.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
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
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:number, :formas_pago_id, :paciente_id, :pedido_id, :date, sale_details_attributes: [:id, :sale_id, :insumo_id, :number, :qty, :price, :_destroy] )
    end
end
