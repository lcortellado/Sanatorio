class CiudadesController < ApplicationController
  before_action :set_ciudade, only: [:show, :edit, :update, :destroy]

  # GET /ciudades
  # GET /ciudades.json
     PAGE_SIZE = 5
  def index
  
      
      @page = (params[:page] || 0).to_i

   if params[:keywords].present?
     @keywords = params[:keywords]
     @ciudades = Ciudade.where("lower(nombre) LIKE '%#{@keywords.downcase}%'").order("nombre ASC" )
                    .offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = Ciudade.where("lower(nombre) LIKE '%#{@keywords.downcase}%'").count

       else
     @ciudades = Ciudade.order('nombre ASC').offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = Ciudade.count
   end
   @number_of_pages = (number_of_records % PAGE_SIZE) == 0 ? 
                       number_of_records / PAGE_SIZE - 1 : number_of_records / PAGE_SIZE
  end

  # GET /ciudades/1
  # GET /ciudades/1.json
  def show
 
        
     
  end

  # GET /ciudades/new
  def new
    @ciudade = Ciudade.new
  end

  # GET /ciudades/1/edit
  def edit
  end

  # POST /ciudades
  # POST /ciudades.json
  def create
    @ciudade = Ciudade.new(ciudade_params)

    respond_to do |format|
      if @ciudade.save
        format.html { redirect_to ciudades_url, notice: 'Ciudad creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @ciudade }
          
      else
        format.html { render :new }
        format.json { render json: @ciudade.errors, status: :unprocessable_entity }
          format.js { render show: @ciudade.errors }
      end
    end
  end

  # PATCH/PUT /ciudades/1
  # PATCH/PUT /ciudades/1.json
  def update
    respond_to do |format|
      if @ciudade.update(ciudade_params)
        format.html { redirect_to ciudades_url, notice: 'Ciudade was successfully updated.' }
        format.json { render :show, status: :ok, location: @ciudade }
      else
        format.html { render :edit }
        format.json { render json: @ciudade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ciudades/1
  # DELETE /ciudades/1.json
  def destroy
    @ciudade.destroy
    respond_to do |format|
      format.html { redirect_to ciudades_url, notice: 'Ciudade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ciudade
      @ciudade = Ciudade.find(params[:id])
    end
    
     
   

    # Never trust parameters from the scary internet, only allow the white list through.
    def ciudade_params
      params.require(:ciudade).permit(:nombre, :departamento_id, :codigo)
    end
end
