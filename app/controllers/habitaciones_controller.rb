class HabitacionesController < ApplicationController
  before_action :set_habitacione, only: [:show, :edit, :update, :destroy]

  # GET /habitaciones
  # GET /habitaciones.json
  def index
    @habitaciones = Habitacione.all
  end

  # GET /habitaciones/1
  # GET /habitaciones/1.json
  def show
  end

  # GET /habitaciones/new
  def new
    @habitacione = Habitacione.new
  end

  # GET /habitaciones/1/edit
  def edit
  end

  # POST /habitaciones
  # POST /habitaciones.json
  def create
    @habitacione = Habitacione.new(habitacione_params)

    respond_to do |format|
      if @habitacione.save
        format.html { redirect_to @habitacione, notice: 'Habitacione was successfully created.' }
        format.json { render :show, status: :created, location: @habitacione }
      else
        format.html { render :new }
        format.json { render json: @habitacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /habitaciones/1
  # PATCH/PUT /habitaciones/1.json
  def update
    respond_to do |format|
      if @habitacione.update(habitacione_params)
        format.html { redirect_to @habitacione, notice: 'Habitacione was successfully updated.' }
        format.json { render :show, status: :ok, location: @habitacione }
      else
        format.html { render :edit }
        format.json { render json: @habitacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /habitaciones/1
  # DELETE /habitaciones/1.json
  def destroy
    @habitacione.destroy
    respond_to do |format|
      format.html { redirect_to habitaciones_url, notice: 'Habitacione was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_habitacione
      @habitacione = Habitacione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def habitacione_params
      params.require(:habitacione).permit(:descripcion, :nrohabit)
    end
end
