class DetalleInternacionesController < ApplicationController
  before_action :set_detalle_internacione, only: [:show, :edit, :update, :destroy]

  # GET /detalle_internaciones
  # GET /detalle_internaciones.json
  def index
    @detalle_internaciones = DetalleInternacione.all
  end

  # GET /detalle_internaciones/1
  # GET /detalle_internaciones/1.json
  def show
  end

  # GET /detalle_internaciones/new
  def new
    @detalle_internacione = DetalleInternacione.new
  end

  # GET /detalle_internaciones/1/edit
  def edit
  end

  # POST /detalle_internaciones
  # POST /detalle_internaciones.json
  def create
    @detalle_internacione = DetalleInternacione.new(detalle_internacione_params)

    respond_to do |format|
      if @detalle_internacione.save
        format.html { redirect_to @detalle_internacione, notice: 'Detalle internacione was successfully created.' }
        format.json { render :show, status: :created, location: @detalle_internacione }
      else
        format.html { render :new }
        format.json { render json: @detalle_internacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_internaciones/1
  # PATCH/PUT /detalle_internaciones/1.json
  def update
    respond_to do |format|
      if @detalle_internacione.update(detalle_internacione_params)
        format.html { redirect_to @detalle_internacione, notice: 'Detalle internacione was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle_internacione }
      else
        format.html { render :edit }
        format.json { render json: @detalle_internacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_internaciones/1
  # DELETE /detalle_internaciones/1.json
  def destroy
    @detalle_internacione.destroy
    respond_to do |format|
      format.html { redirect_to detalle_internaciones_url, notice: 'Detalle internacione was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_internacione
      @detalle_internacione = DetalleInternacione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_internacione_params
      params.require(:detalle_internacione).permit(:descripcion, :cantidad, :preciouni, :subtotal, :fecha, :hora, :internacione_id)
    end
end
