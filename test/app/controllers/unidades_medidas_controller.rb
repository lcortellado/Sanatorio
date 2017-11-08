class UnidadesMedidasController < ApplicationController
  before_action :set_unidades_medida, only: [:show, :edit, :update, :destroy]

  # GET /unidades_medidas
  # GET /unidades_medidas.json
  def index
    @unidades_medidas = UnidadesMedida.all
  end

  # GET /unidades_medidas/1
  # GET /unidades_medidas/1.json
  def show
  end

  # GET /unidades_medidas/new
  def new
    @unidades_medida = UnidadesMedida.new
  end

  # GET /unidades_medidas/1/edit
  def edit
  end

  # POST /unidades_medidas
  # POST /unidades_medidas.json
  def create
    @unidades_medida = UnidadesMedida.new(unidades_medida_params)

    respond_to do |format|
      if @unidades_medida.save
        format.html { redirect_to @unidades_medida, notice: 'Unidades medida was successfully created.' }
        format.json { render :show, status: :created, location: @unidades_medida }
      else
        format.html { render :new }
        format.json { render json: @unidades_medida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unidades_medidas/1
  # PATCH/PUT /unidades_medidas/1.json
  def update
    respond_to do |format|
      if @unidades_medida.update(unidades_medida_params)
        format.html { redirect_to @unidades_medida, notice: 'Unidades medida was successfully updated.' }
        format.json { render :show, status: :ok, location: @unidades_medida }
      else
        format.html { render :edit }
        format.json { render json: @unidades_medida.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unidades_medidas/1
  # DELETE /unidades_medidas/1.json
  def destroy
    @unidades_medida.destroy
    respond_to do |format|
      format.html { redirect_to unidades_medidas_url, notice: 'Unidades medida was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unidades_medida
      @unidades_medida = UnidadesMedida.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unidades_medida_params
      params.require(:unidades_medida).permit(:descripcion)
    end
end
