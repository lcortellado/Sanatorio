class ProveedoresController < ApplicationController
  before_action :set_proveedore, only: [:show, :edit, :update, :destroy]

  # GET /proveedores
  # GET /proveedores.json
  def index
    @proveedores = Proveedore.all
  end

  # GET /proveedores/1
  # GET /proveedores/1.json
  def show
  end

  # GET /proveedores/new
  def new
    @proveedore = Proveedore.new
  end

  # GET /proveedores/1/edit
  def edit
  end

  # POST /proveedores
  # POST /proveedores.json
  def create
    @proveedore = Proveedore.new(proveedore_params)

    respond_to do |format|
      if @proveedore.save
        format.html { redirect_to proveedores_url, notice: 'Proveedore was successfully created.' }
        format.json { render :show, status: :created, location: @proveedore }
      else
        format.html { render :new }
        format.json { render json: @proveedore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proveedores/1
  # PATCH/PUT /proveedores/1.json
  def update
    respond_to do |format|
      if @proveedore.update(proveedore_params)
        format.html { redirect_to proveedores_url, notice: 'Proveedore was successfully updated.' }
        format.json { render :show, status: :ok, location: @proveedore }
      else
        format.html { render :edit }
        format.json { render json: @proveedore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proveedores/1
  # DELETE /proveedores/1.json
  def destroy
    @proveedore.destroy
    respond_to do |format|
      format.html { redirect_to proveedores_url, notice: 'Proveedore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proveedore
      @proveedore = Proveedore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proveedore_params
      params.require(:proveedore).permit(:cedula, :nombre, :apellido, :ciudade_id, :direccion, :empresa, :telefono, :celular, :correo)
    end
end
