class ProductsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_stack

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    if @product.update(product_params)
      redirect_to stack_product_url(@stack, @product), notice: "Product was successfully updated." 
      render :show, status: :ok, location: @product 
    else
      render :edit, status: :unprocessable_entity

    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    redirect_to stack_url(@stack), notice: "Product was successfully destroyed."
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :description, :link, :asin, :price, :brand_id)
    end

    def set_stack
      @stack = Stack.find(params[:stack_id])
    end
end
