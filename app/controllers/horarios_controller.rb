class HorariosController < ApplicationController
  before_action :set_horario, only: [:show, :edit, :update, :destroy]

  # GET /horarios
  # GET /horarios.json
  PAGE_SIZE = 5
  def index
  
      
      @page = (params[:page] || 0).to_i

   if params[:keywords].present?
     @keywords = params[:keywords]
     @horarios = Horario.where("lower(codigo) LIKE '%#{@keywords.downcase}%'").order("codigo ASC" )
                    .offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = Horario.where("lower(codigo) LIKE '%#{@keywords.downcase}%'").count

       else
     @horarios = Horario.order('codigo ASC').offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
     number_of_records = Horario.count
   end
   @number_of_pages = (number_of_records % PAGE_SIZE) == 0 ? 
                       number_of_records / PAGE_SIZE - 1 : number_of_records / PAGE_SIZE
  end


  # GET /horarios/1
  # GET /horarios/1.json
  def show
  end

  # GET /horarios/new
  def new
    @horario = Horario.new
  end

  # GET /horarios/1/edit
  def edit
  end

  # POST /horarios
  # POST /horarios.json
  def create
    @horario = Horario.new(horario_params)

    respond_to do |format|
      if @horario.save
        format.html { redirect_to horarios_url, notice: 'Horario Creado.' }
        format.json { render :show, status: :created, location: @horario }
      else
        format.html { render :new }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /horarios/1
  # PATCH/PUT /horarios/1.json
  def update
    respond_to do |format|
      if @horario.update(horario_params)
        format.html { redirect_to @horario, notice: 'Horario was successfully updated.' }
        format.json { render :show, status: :ok, location: @horario }
      else
        format.html { render :edit }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /horarios/1
  # DELETE /horarios/1.json
  def destroy
    @horario.destroy
    respond_to do |format|
      format.html { redirect_to horarios_url, notice: 'Horario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horario
      @horario = Horario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def horario_params
      params.require(:horario).permit(:codigo, :medico_id, :dia_id, :horadesde, :horahasta)
    end
end
