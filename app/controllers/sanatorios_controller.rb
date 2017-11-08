class SanatoriosController < ApplicationController
  before_action :set_sanatorio, only: [:show, :edit, :update, :destroy]

  # GET /sanatorios
  # GET /sanatorios.json
  def index
    @sanatorios = Sanatorio.all
  end

  # GET /sanatorios/1
  # GET /sanatorios/1.json
  def show
  end

  # GET /sanatorios/new
  def new
    @sanatorio = Sanatorio.new
  end

  # GET /sanatorios/1/edit
  def edit
  end

  # POST /sanatorios
  # POST /sanatorios.json
  def create
    @sanatorio = Sanatorio.new(sanatorio_params)

    respond_to do |format|
      if @sanatorio.save
        format.html { redirect_to @sanatorio, notice: 'Sanatorio was successfully created.' }
        format.json { render :show, status: :created, location: @sanatorio }
      else
        format.html { render :new }
        format.json { render json: @sanatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sanatorios/1
  # PATCH/PUT /sanatorios/1.json
  def update
    respond_to do |format|
      if @sanatorio.update(sanatorio_params)
        format.html { redirect_to @sanatorio, notice: 'Sanatorio was successfully updated.' }
        format.json { render :show, status: :ok, location: @sanatorio }
      else
        format.html { render :edit }
        format.json { render json: @sanatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sanatorios/1
  # DELETE /sanatorios/1.json
  def destroy
    @sanatorio.destroy
    respond_to do |format|
      format.html { redirect_to sanatorios_url, notice: 'Sanatorio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sanatorio
      @sanatorio = Sanatorio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sanatorio_params
      params.require(:sanatorio).permit(:nombre, :direccion, :telefono1, :telefono2, :telefon3, :pagina, :photo)
    end
end
