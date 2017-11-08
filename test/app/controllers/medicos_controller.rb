class MedicosController < ApplicationController
  before_action :set_medico, only: [:show, :edit, :update, :destroy]

  # GET /medicos
  # GET /medicos.json
  PAGE_SIZE = 5
  def index
  
      
      @page = (params[:page] || 0).to_i

   if params[:keywords].present?
     @keywords = params[:keywords]
     @medicos = Medico.where("lower(ci) LIKE '%#{@keywords.downcase}%'").order("ci ASC" )
                    .offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = Medico.where("lower(ci) LIKE '%#{@keywords.downcase}%'").count

       else
     @medicos = Medico.order('ci ASC').offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = Medico.count
   end
   @number_of_pages = (number_of_records % PAGE_SIZE) == 0 ? 
                       number_of_records / PAGE_SIZE - 1 : number_of_records / PAGE_SIZE

  end

  # GET /medicos/1
  # GET /medicos/1.json
  def show
  end

  # GET /medicos/new
  def new
    @medico = Medico.new
  end

  # GET /medicos/1/edit
  def edit
  end

  # POST /medicos
  # POST /medicos.json
  def create
    @medico = Medico.new(medico_params)

    respond_to do |format|
      if @medico.save
        format.html { redirect_to medicos_url, notice: 'Medico creado exitosamente.' }
        format.json { render :show, status: :created, location: @medico }
      else
        format.html { render :new }
        format.json { render json: @medico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicos/1
  # PATCH/PUT /medicos/1.json
  def update
    respond_to do |format|
      if @medico.update(medico_params)
        format.html { redirect_to medicos_url, notice: 'Medico was successfully updated.' }
        format.json { render :show, status: :ok, location: @medico }
      else
        format.html { render :edit }
        format.json { render json: @medico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicos/1
  # DELETE /medicos/1.json
  def destroy
    @medico.destroy
    respond_to do |format|
      format.html { redirect_to medicos_url, notice: 'Medico was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medico
      @medico = Medico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medico_params
      params.require(:medico).permit(:ci, :nro_registro, :nombre, :apellido,:fecha, :ciudade_id, :direccion, :telefono, :celular, :fecha_naci, :correo, :contacto_familiar, :especialidade_id)
    end
end
