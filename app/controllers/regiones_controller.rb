class RegionesController < ApplicationController
  before_action :set_regione, only: [:show, :edit, :update, :destroy]

  # GET /regiones
  # GET /regiones.json
  def index
    @regiones = Regione.all
  end

  # GET /regiones/1
  # GET /regiones/1.json
  def show
  end

  # GET /regiones/new
  def new
    @regione = Regione.new
  end

  # GET /regiones/1/edit
  def edit
  end

  # POST /regiones
  # POST /regiones.json
  def create
    @regione = Regione.new(regione_params)

    respond_to do |format|
      if @regione.save
        format.html { redirect_to @regione, notice: 'Regione was successfully created.' }
        format.json { render :show, status: :created, location: @regione }
      else
        format.html { render :new }
        format.json { render json: @regione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regiones/1
  # PATCH/PUT /regiones/1.json
  def update
    respond_to do |format|
      if @regione.update(regione_params)
        format.html { redirect_to @regione, notice: 'Regione was successfully updated.' }
        format.json { render :show, status: :ok, location: @regione }
      else
        format.html { render :edit }
        format.json { render json: @regione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regiones/1
  # DELETE /regiones/1.json
  def destroy
    @regione.destroy
    respond_to do |format|
      format.html { redirect_to regiones_url, notice: 'Regione was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_regione
      @regione = Regione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def regione_params
      params.require(:regione).permit(:codigo, :nombre)
    end
end
