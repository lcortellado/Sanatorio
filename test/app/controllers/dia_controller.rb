class DiaController < ApplicationController
  before_action :set_dias, only: [:show, :edit, :update, :destroy]

  # GET /dia
  # GET /dia.json
  def index
    @dia = Dias.all
  end

  # GET /dia/1
  # GET /dia/1.json
  def show
  end

  # GET /dia/new
  def new
    @dias = Dias.new
  end

  # GET /dia/1/edit
  def edit
  end

  # POST /dia
  # POST /dia.json
  def create
    @dias = Dias.new(dias_params)

    respond_to do |format|
      if @dias.save
        format.html { redirect_to @dias, notice: 'Dias was successfully created.' }
        format.json { render :show, status: :created, location: @dias }
      else
        format.html { render :new }
        format.json { render json: @dias.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dia/1
  # PATCH/PUT /dia/1.json
  def update
    respond_to do |format|
      if @dias.update(dias_params)
        format.html { redirect_to @dias, notice: 'Dias was successfully updated.' }
        format.json { render :show, status: :ok, location: @dias }
      else
        format.html { render :edit }
        format.json { render json: @dias.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dia/1
  # DELETE /dia/1.json
  def destroy
    @dias.destroy
    respond_to do |format|
      format.html { redirect_to dia_url, notice: 'Dias was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dias
      @dias = Dias.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dias_params
      params.require(:dias).permit(:codigo, :nombre)
    end
end
