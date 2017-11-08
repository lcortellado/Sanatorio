class ProductsController < ApplicationController
	def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(allowed_params)
    if @product.save
      redirect_to products_url, notice: "Successfully created product."
    else
      render :new
    end
    respond_to do |format|
      if @barrio.save
        format.html { redirect_to @product, notice: 'Barrio was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @barrio.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(allowed_params)
      redirect_to products_url, notice: "Successfully created product."
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url, notice: "Successfully destroyed product."
  end

  private
  def allowed_params
    params.require(:product).permit!
  end
end
