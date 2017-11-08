class TipoIvasController < ApplicationController
  before_action :set_tipo_iva, only: [:show, :edit, :update, :destroy]

  # GET /tipo_ivas
  # GET /tipo_ivas.json
  def index
    @tipo_ivas = TipoIva.all
  end

  # GET /tipo_ivas/1
  # GET /tipo_ivas/1.json
  def show
  end

  # GET /tipo_ivas/new
  def new
    @tipo_iva = TipoIva.new
  end

  # GET /tipo_ivas/1/edit
  def edit
  end

  # POST /tipo_ivas
  # POST /tipo_ivas.json
  def create
    @tipo_iva = TipoIva.new(tipo_iva_params)

    respond_to do |format|
      if @tipo_iva.save
        format.html { redirect_to @tipo_iva, notice: 'Tipo iva was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_iva }
      else
        format.html { render :new }
        format.json { render json: @tipo_iva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_ivas/1
  # PATCH/PUT /tipo_ivas/1.json
  def update
    respond_to do |format|
      if @tipo_iva.update(tipo_iva_params)
        format.html { redirect_to @tipo_iva, notice: 'Tipo iva was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_iva }
      else
        format.html { render :edit }
        format.json { render json: @tipo_iva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_ivas/1
  # DELETE /tipo_ivas/1.json
  def destroy
    @tipo_iva.destroy
    respond_to do |format|
      format.html { redirect_to tipo_ivas_url, notice: 'Tipo iva was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_iva
      @tipo_iva = TipoIva.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_iva_params
      params.require(:tipo_iva).permit(:decripcion)
    end
end
