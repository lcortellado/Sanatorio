class TurnoDiaController < ApplicationController
  before_action :set_turno_dias, only: [:show, :edit, :update, :destroy]

  # GET /turno_dia
  # GET /turno_dia.json
  def index
    @turno_dia = TurnoDias.all
  end

  # GET /turno_dia/1
  # GET /turno_dia/1.json
  def show
  end

  # GET /turno_dia/new
  def new
    @turno_dias = TurnoDias.new
  end

  # GET /turno_dia/1/edit
  def edit
  end

  # POST /turno_dia
  # POST /turno_dia.json
  def create
    @turno_dias = TurnoDias.new(turno_dias_params)

    respond_to do |format|
      if @turno_dias.save
        format.html { redirect_to @turno_dias, notice: 'Turno dias was successfully created.' }
        format.json { render :show, status: :created, location: @turno_dias }
      else
        format.html { render :new }
        format.json { render json: @turno_dias.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turno_dia/1
  # PATCH/PUT /turno_dia/1.json
  def update
    respond_to do |format|
      if @turno_dias.update(turno_dias_params)
        format.html { redirect_to @turno_dias, notice: 'Turno dias was successfully updated.' }
        format.json { render :show, status: :ok, location: @turno_dias }
      else
        format.html { render :edit }
        format.json { render json: @turno_dias.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turno_dia/1
  # DELETE /turno_dia/1.json
  def destroy
    @turno_dias.destroy
    respond_to do |format|
      format.html { redirect_to turno_dia_url, notice: 'Turno dias was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turno_dias
      @turno_dias = TurnoDias.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def turno_dias_params
      params.require(:turno_dias).permit(:nombre)
    end
end
