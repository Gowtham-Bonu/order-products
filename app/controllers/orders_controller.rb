class OrdersController < ApplicationController
  before_action :get_order, only: [:edit, :update, :destroy]

  def get_order
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @order.update(order_params)
      @product = Product.find(params[:product_id])
      redirect_to product_path(@product)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @products = Product.all
  end

  def show
  end

  def destroy
    @order.destroy
    @product = Product.find(params[:product_id])
    redirect_to product_path(@product), status: :see_other
  end

  private

  def order_params
    params.require(:order).permit(:name, :status, :quantity, :product_id)
  end
end
