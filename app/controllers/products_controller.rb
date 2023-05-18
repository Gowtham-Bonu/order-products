class ProductsController < ApplicationController
  before_action :get_product, only: [:edit, :update, :destroy, :show]

  def index
    @products = Product.all
  end

  def show
    @orders = @product.orders
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: "you have successfully created a product"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to root_path, notice: "you have successfully updated the product"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path, status: :see_other, notice: "you have successfully deleted the product"
    else
      redirect_to root_path, status: :unprocessable_entity, alert: "The delete action didn't work.."
    end
  end

  private

  def get_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :cost, :brand)
  end
end
