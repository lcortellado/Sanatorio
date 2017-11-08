class InsumosController < ApplicationController
  before_action :set_insumo, only: [:show, :edit, :update, :destroy]
  before_action :set_combo_values, only: [:new, :edit]
  # GET /insumos
  # GET /insumos.json

  PAGE_SIZE = 5
  def index
  
      
      @page = (params[:page] || 0).to_i

   if params[:keywords].present?
     @keywords = params[:keywords]
     @insumos = Insumo.where("lower(descripcion) LIKE '%#{@keywords.downcase}%'").order("descripcion ASC" )
                    .offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = Insumo.where("lower(descripcion) LIKE '%#{@keywords.downcase}%'").count

       else
     @insumos = Insumo.order('descripcion ASC').offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = Insumo.count
   end
   @number_of_pages = (number_of_records % PAGE_SIZE) == 0 ? 
                       number_of_records / PAGE_SIZE - 1 : number_of_records / PAGE_SIZE
 
  

  respond_to do |format|
      format.html
      format.js
      format.pdf do
        pdf = InsumosPdf.new(@insumos)
        send_data pdf.render, filename: 'insumos.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end


  # GET /insumos/1
  # GET /insumos/1.json
  def show
  end

  # GET /insumos/new
  def new
    @insumo = Insumo.new
  end

  # GET /insumos/1/edit
  def edit
  end

  # POST /insumos
  # POST /insumos.json
  def create
    @insumo = Insumo.new(insumo_params)

    respond_to do |format|
      if @insumo.save
        format.html { redirect_to insumos_url, notice: 'Insumo Creado.' }
        format.json { render :show, status: :created, location: @insumo }
      else
        format.html { render :new }
        format.json { render json: @insumo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insumos/1
  # PATCH/PUT /insumos/1.json
  def update
    respond_to do |format|
      if @insumo.update(insumo_params)
        format.html { redirect_to insumos_url, notice: 'Insumo was successfully updated.' }
        format.json { render :show, status: :ok, location: @insumo }
      else
        format.html { render :edit }
        format.json { render json: @insumo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insumos/1
  # DELETE /insumos/1.json
  def destroy
    @insumo.destroy
    respond_to do |format|
      format.html { redirect_to insumos_url, notice: 'Insumo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
def autocomplete
  render json: Insumo.search(params[:query], autocomplete: true, limit: 10).map(&:descripcion)
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insumo
      @insumo = Insumo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insumo_params
      params.require(:insumo).permit(:descripcion, :precio_compra, :precio_venta, :stock, :stock_minimo, :unidades_medida_id, :proveedore_id, :tipo_iva_id, :nombre, :codigo)
    end
end
