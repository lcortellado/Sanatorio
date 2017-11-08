class TipoConsultsController < ApplicationController
  before_action :set_tipo_consult, only: [:show, :edit, :update, :destroy]

  # GET /tipo_consults
  # GET /tipo_consults.json
  def index
    @tipo_consults = TipoConsult.all
  end

  # GET /tipo_consults/1
  # GET /tipo_consults/1.json
  def show
  end

  # GET /tipo_consults/new
  def new
    @tipo_consult = TipoConsult.new
  end

  # GET /tipo_consults/1/edit
  def edit
  end

  # POST /tipo_consults
  # POST /tipo_consults.json
  def create
    @tipo_consult = TipoConsult.new(tipo_consult_params)

    respond_to do |format|
      if @tipo_consult.save
        format.html { redirect_to @tipo_consult, notice: 'Tipo consult was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_consult }
      else
        format.html { render :new }
        format.json { render json: @tipo_consult.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_consults/1
  # PATCH/PUT /tipo_consults/1.json
  def update
    respond_to do |format|
      if @tipo_consult.update(tipo_consult_params)
        format.html { redirect_to @tipo_consult, notice: 'Tipo consult was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_consult }
      else
        format.html { render :edit }
        format.json { render json: @tipo_consult.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_consults/1
  # DELETE /tipo_consults/1.json
  def destroy
    @tipo_consult.destroy
    respond_to do |format|
      format.html { redirect_to tipo_consults_url, notice: 'Tipo consult was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_consult
      @tipo_consult = TipoConsult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_consult_params
      params.require(:tipo_consult).permit(:descripcion)
    end
end
