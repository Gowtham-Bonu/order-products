class ProductsController < ApplicationController
  before_action :get_product, only: [:edit, :update, :destroy, :show]

  def get_product
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @products = Product.all
  end

  def show
    @orders = @product.orders
  end

  def destroy
    @product.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :cost, :brand)
  end
end
