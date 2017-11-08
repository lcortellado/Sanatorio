class HistoriasController < ApplicationController
  before_action :set_historia, only: [:show, :edit, :update, :destroy]

  # GET /historias
  # GET /historias.json
  def index
    @historias = Historia.all
    
  end

  # GET /historias/1
  # GET /historias/1.json
  def show
     @historias = Historia.find(params[:id])
    respond_to do |format|
      format.html 
     format.pdf do
        pdf = HistoriasPdf.new(@historias)
        send_data pdf.render, filename: 'historias.pdf', type: 'application/pdf', disposition: 'inline'
      end
   end
end

  

  # GET /historias/new
  def new
    @historia = Historia.new
  end

  # GET /historias/1/edit
  def edit
  end

  # POST /historias
  # POST /historias.json
  def create
    @historia = Historia.new(historia_params)

    respond_to do |format|
      if @historia.save
        format.html { redirect_to @historia, notice: 'Historia was successfully created.' }
        format.json { render :show, status: :created, location: @historia }
      else
        format.html { render :new }
        format.json { render json: @historia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historias/1
  # PATCH/PUT /historias/1.json
  def update
    respond_to do |format|
      if @historia.update(historia_params)
        format.html { redirect_to @historia, notice: 'Historia was successfully updated.' }
        format.json { render :show, status: :ok, location: @historia }
      else
        format.html { render :edit }
        format.json { render json: @historia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historias/1
  # DELETE /historias/1.json
  def destroy
    @historia.destroy
    respond_to do |format|
      format.html { redirect_to historias_url, notice: 'Historia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historia
      @historia = Historia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historia_params
      params.require(:historia).permit(:codigo, :diagnostico, :indicaciones, :fecha_proxima_cita, :recomendaciones, :reserva_id, :estudios, :resultestudios, :precio, :descuento, :total)
    end
end
