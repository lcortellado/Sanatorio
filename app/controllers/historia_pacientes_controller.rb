class HistoriaPacientesController < ApplicationController
  before_action :set_historia_paciente, only: [:show, :edit, :update, :destroy]

  # GET /historia_pacientes
  # GET /historia_pacientes.json
  def index
    @historia_pacientes = HistoriaPaciente.all
  end

  # GET /historia_pacientes/1
  # GET /historia_pacientes/1.json
  def show
@historia_paciente = HistoriaPaciente.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = HistoriaPacientePdf.new(@historia_paciente
          )
        send_data pdf.render, filename: 'historia_paciente.pdf', type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  # GET /historia_pacientes/new
  def new
    @historia_paciente = HistoriaPaciente.new
  end

  # GET /historia_pacientes/1/edit
  def edit
  end

  # POST /historia_pacientes
  # POST /historia_pacientes.json
  def create
    @historia_paciente = HistoriaPaciente.new(historia_paciente_params)

    respond_to do |format|
      if @historia_paciente.save
        format.html { redirect_to historia_pacientes_url, notice: 'Historia paciente was successfully created.' }
        format.json { render :show, status: :created, location: @historia_paciente }
      else
        format.html { render :new }
        format.json { render json: @historia_paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historia_pacientes/1
  # PATCH/PUT /historia_pacientes/1.json
  def update
    respond_to do |format|
      if @historia_paciente.update(historia_paciente_params)
        format.html { redirect_to historia_pacientes_url, notice: 'Historia paciente was successfully updated.' }
        format.json { render :show, status: :ok, location: @historia_paciente }
      else
        format.html { render :edit }
        format.json { render json: @historia_paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historia_pacientes/1
  # DELETE /historia_pacientes/1.json
  def destroy
    @historia_paciente.destroy
    respond_to do |format|
      format.html { redirect_to historia_pacientes_url, notice: 'Historia paciente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historia_paciente
      @historia_paciente = HistoriaPaciente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historia_paciente_params
      params.require(:historia_paciente).permit(:diagnostico, :estudios, :resultestudios, :precio, :descuento, :total, :indicaciones, :fecha_proxima_cita, :recomendaciones, :reserva_id)
    end
end
