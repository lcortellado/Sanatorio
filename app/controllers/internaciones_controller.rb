class InternacionesController < ApplicationController
  before_action :set_internacione, only: [:show, :edit, :update, :destroy]

  # GET /internaciones
  # GET /internaciones.json
  def index
    @internaciones = Internacione.all
  end

  # GET /internaciones/1
  # GET /internaciones/1.json
  def show
  end

  # GET /internaciones/new
  def new
    @internacione = Internacione.new
  end

  # GET /internaciones/1/edit
  def edit
  end

  # POST /internaciones
  # POST /internaciones.json
  def create
    @internacione = Internacione.new(internacione_params)

    respond_to do |format|
      if @internacione.save
        format.html { redirect_to @internacione, notice: 'Internacione was successfully created.' }
        format.json { render :show, status: :created, location: @internacione }
      else
        format.html { render :new }
        format.json { render json: @internacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internaciones/1
  # PATCH/PUT /internaciones/1.json
  def update
    respond_to do |format|
      if @internacione.update(internacione_params)
        format.html { redirect_to @internacione, notice: 'Internacione was successfully updated.' }
        format.json { render :show, status: :ok, location: @internacione }
      else
        format.html { render :edit }
        format.json { render json: @internacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internaciones/1
  # DELETE /internaciones/1.json
  def destroy
    @internacione.destroy
    respond_to do |format|
      format.html { redirect_to internaciones_url, notice: 'Internacione was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internacione
      @internacione = Internacione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internacione_params
      params.require(:internacione).permit(:fechaIng, :horaIng, :fechaSalida, :horaSalida, :habitacione_id, :paciente_id, :medico_id, :totalGasto)
    end
end
